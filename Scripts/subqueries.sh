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

INPUT_SUBQUERIES_OPERATORS_FILE="${PKG_DIR}/Scripts/SimpleOperators.txt"
INPUT_SUBQUERIES_TYPES_FILE="${PKG_DIR}/Scripts/SubqueriesTypes.txt"
INPUT_IN_SUBQUERY_TYPES_FILE="${PKG_DIR}/Scripts/InSelectTypes.txt"

OUTPUT_FILE="${PKG_DIR}/Sources/SwiftKuery/Subqueries_GlobalFunctionsAndExtensions.swift"

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

# Generate operators with subqueries, i.e. 'expression operator ANY/ALL(subquery)'
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
        if [[ $LHS_TYPE_LOWER == *"ColumnExpression" ]]
        then
            LHS_TYPE_LOWER="columnExpression"
        fi

cat <<EOF >> ${OUTPUT_FILE}
/// Create a \`$TYPE\` clause using the operator $OPERATOR for $LHS_TYPE
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A \`$TYPE\` containing the clause.
public func $OPERATOR(lhs: $LHS_TYPE, rhs: $RHS_TYPE) -> $TYPE {
    return $TYPE(lhs: .$LHS_TYPE_LOWER(lhs), rhs: rhs, condition: .$CASE)
}

EOF

done < $INPUT_SUBQUERIES_TYPES_FILE
done < $INPUT_SUBQUERIES_OPERATORS_FILE

# Generate extensions for IN, NOT IN with subquery

while read -r LINE; do
    [ -z "$LINE" ] && continue
    [[ "$LINE" =~ ^#.*$ ]] && continue
    stringarray=($LINE)
    CLAUSE=${stringarray[0]}
    TYPE=${stringarray[1]}
    TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"
    if [[ $TYPE_LOWER == *"ColumnExpression" ]]
    then
        TYPE_LOWER="columnExpression"
    fi

echo "public extension $TYPE {" >> ${OUTPUT_FILE}

    for OPERATOR in \`in\` notIn; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the $OPERATOR operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func $OPERATOR(_ query: Select) -> $CLAUSE {
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .select(query), condition: .$OPERATOR)
    }
EOF
    done
echo "}" >> ${OUTPUT_FILE}
done < $INPUT_IN_SUBQUERY_TYPES_FILE

