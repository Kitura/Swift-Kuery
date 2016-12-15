#!/bin/bash

#/**
#* Copyright IBM Corporation 2016
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

if ! [ -d "${PKG_DIR}/Sources" ]; then
echo "Failed to find ${PKG_DIR}/Sources"
exit 1
fi

INPUT_CLAUSES_FILE="${PKG_DIR}/Scripts/ColumnExtensionClauses.txt"
INPUT_OPERANDS_FILE="${PKG_DIR}/Scripts/ColumnExtensionOperands.txt"

OUTPUT_FILE="${PKG_DIR}/Sources/ColumnAndExpressions_Extensions.swift"

echo "--- Generating ${OUTPUT_FILE}"

cat <<'EOF' > ${OUTPUT_FILE}
/**
* Copyright IBM Corporation 2016
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

EOF

# Generate extensions for Scalar/AggregateColumnExpression and Column for (NOT)LIKE, (NOT)BETWEEN, (NOT)IN, and IS (NOT) NULL operators
while read -r LINE; do
    [ -z "$LINE" ] && continue
    [[ "$LINE" =~ ^#.*$ ]] && continue
    stringarray=($LINE)
    CLAUSE_TYPE=${stringarray[0]}
    TYPE=${stringarray[1]}
    TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"
    if [[ $TYPE_LOWER == *"ColumnExpression" ]]
    then
        TYPE_LOWER="columnExpression"
    fi

cat <<EOF >> ${OUTPUT_FILE}
public extension $TYPE {
EOF
        for OPERATOR in like notLike; do

cat <<EOF >> ${OUTPUT_FILE}
    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator.
    ///
    /// - Parameter pattern: The pattern to use in the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR(_ pattern: String) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .string(pattern), condition: .$OPERATOR)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator with \`Parameter\`.
    ///
    /// - Parameter pattern: The pattern to use in the $OPERATOR expression as \`Parameter\`.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR(_ pattern: Parameter) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .parameter(pattern), condition: .$OPERATOR)
    }

EOF
        done
    for PARAM_TYPE in `sed '/^$/d' ${INPUT_OPERANDS_FILE} | sed '/^#/d'`; do
        PARAM_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${PARAM_TYPE:0:1})${PARAM_TYPE:1}"

        for OPERATOR in between notBetween; do

cat <<EOF >> ${OUTPUT_FILE}
    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator for $PARAM_TYPE.
    ///
    /// - Parameter value1: The left hand side of the $OPERATOR expression.
    /// - Parameter and value2: The right hand side of the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR(_ value1: $PARAM_TYPE, and value2: $PARAM_TYPE) -> $CLAUSE_TYPE {
        var array = [$PARAM_TYPE]()
        array.append(value1)
        array.append(value2)
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(array), condition: .$OPERATOR)
    }
EOF
        done
        for OPERATOR in \`in\` notIn; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator for $PARAM_TYPE.
    ///
    /// - Parameter values: The list of values for the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR(_ values: $PARAM_TYPE...) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(values), condition: .$OPERATOR)
    }
EOF
        done
done

    for OPERATOR in isNull isNotNull; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator.
    ///
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR() -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), condition: .$OPERATOR)
    }
EOF
done

echo "}" >> ${OUTPUT_FILE}
done < $INPUT_CLAUSES_FILE
