#!/bin/bash

#/**
#* Copyright IBM Corporation 2016, 2017
#*
#* Licensed under the Apache License, Version 2.0 (the "License");
#* you may not use this file except in compliance with the License.
#* You may obtain a copy of the License at
#*
#* http://www.apache.org/licenses/LICENSE-2.0
#*
#* Unless required by applicable law or agreed to in writing, software
#* distributed under the License is distributed on an "AS IS" BASIS,
#* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#* See the License for the specific language governing permissions and
#* limitations under the License.
#**/

SCRIPT_DIR=$(dirname "$BASH_SOURCE")
cd "$SCRIPT_DIR"
CUR_DIR=$(pwd)

temp=$(dirname "${CUR_DIR}")
temp=$(dirname "${temp}")
PKG_DIR=$(dirname "${CUR_DIR}")

shopt -s nullglob

if ! [ -d "${PKG_DIR}/Sources/SwiftKuery" ]; then
echo "Failed to find ${PKG_DIR}/Sources/SwiftKuery"
exit 1
fi

INPUT_OPERATORS_FILE="${PKG_DIR}/Scripts/SimpleOperators.txt"
INPUT_TYPES_FILE="${PKG_DIR}/Scripts/FilterAndHavingTypes.txt"
INPUT_BOOL_TYPES_FILE="${PKG_DIR}/Scripts/FilterAndHavingBoolTypes.txt"
INPUT_BOOL_OPERATORS_FILE="${PKG_DIR}/Scripts/FilterAndHavingBoolOperators.txt"

OUTPUT_FILE="${PKG_DIR}/Sources/SwiftKuery/FilterAndHaving_GlobalFunctions.swift"

echo "--- Generating ${OUTPUT_FILE}"

cat <<'EOF' > ${OUTPUT_FILE}
/**
* Copyright IBM Corporation 2016, 2017
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Foundation

EOF

# Generate operators for simple conditions that return Filter and Having
for INPUT_TYPES in $INPUT_TYPES_FILE $INPUT_BOOL_TYPES_FILE; do
    if [[ $INPUT_TYPES == *"Bool"* ]]
    then
        INPUT_OPERATORS=$INPUT_BOOL_OPERATORS_FILE
    else
        INPUT_OPERATORS=$INPUT_OPERATORS_FILE
    fi

while read -r LINE; do
    [ -z "$LINE" ] && continue
    [[ "$LINE" =~ ^#.*$ ]] && continue
    stringarray=($LINE)
    OPERATOR=${stringarray[0]}
    CASE=${stringarray[1]}
    while read -r LINE; do
        [ -z "$LINE" ] && continue
        [[ "$LINE" =~ ^#.*$ ]] && continue
        stringarray=($LINE)
        TYPE=${stringarray[0]}
        LHS_TYPE=${stringarray[1]}
        RHS_TYPE=${stringarray[2]}
        LHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${LHS_TYPE:0:1})${LHS_TYPE:1}"
        RHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${RHS_TYPE:0:1})${RHS_TYPE:1}"
        if [[ $LHS_TYPE_LOWER == *"ColumnExpression" ]]
        then
            LHS_TYPE_LOWER="columnExpression"
        fi
        if [[ $RHS_TYPE_LOWER == *"ColumnExpression" ]]
        then
            RHS_TYPE_LOWER="columnExpression"
        fi

cat <<EOF >> ${OUTPUT_FILE}
/// Create a \`$TYPE\` clause using the operator $OPERATOR for $LHS_TYPE
/// and $RHS_TYPE.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A \`$TYPE\` containing the clause.
public func $OPERATOR(lhs: $LHS_TYPE, rhs: $RHS_TYPE) -> $TYPE {
    return $TYPE(lhs: .$LHS_TYPE_LOWER(lhs), rhs: .$RHS_TYPE_LOWER(rhs), condition: .$CASE)
}

EOF

    done < $INPUT_TYPES
done < $INPUT_OPERATORS
done
