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

INPUT_BETWEEN_FILE="${PKG_DIR}/Scripts/ColumnExtensionOperands.txt"

OUTPUT_FILE="${PKG_DIR}/Sources/SpecialOperators_Extensions.swift"

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

# Generate extensions for Int, Double, String, Bool, Float and Parameter IN, NOT IN, BETWEEN and NOT BETWEEN
for TYPE in `sed '/^$/d' ${INPUT_BETWEEN_FILE} | sed '/^#/d'`; do
TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"

echo "public extension $TYPE {" >> ${OUTPUT_FILE}

    for CLAUSE in Filter Having; do

        for OPERATOR in \`in\` notIn; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the $OPERATOR operator.
    ///
    /// - Parameter values: The list of values for the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func $OPERATOR(_ values: $TYPE...) -> $CLAUSE {
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$TYPE(values), condition: .$OPERATOR)
    }
EOF

            if [ $TYPE != Parameter ]; then

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the $OPERATOR operator and \`Parameter\`.
    ///
    /// - Parameter values: The list of values for the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func $OPERATOR(_ values: Parameter...) -> $CLAUSE {
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .arrayOfParameter(values), condition: .$OPERATOR)
    }
EOF
            fi
        done

        for OPERATOR in between notBetween; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the $OPERATOR operator.
    ///
    /// - Parameter value1: The left hand side of the $OPERATOR expression.
    /// - Parameter and value2: The right hand side of the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func $OPERATOR(_ value1: $TYPE, and value2: $TYPE) -> $CLAUSE {
        var array = [$TYPE]()
        array.append(value1)
        array.append(value2)
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$TYPE(array), condition: .$OPERATOR)
    }
EOF

            if [ $TYPE != Parameter ]; then

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the $OPERATOR operator  and \`Parameter\`.
    ///
    /// - Parameter value1: The left hand side of the $OPERATOR expression.
    /// - Parameter and value2: The right hand side of the $OPERATOR expression.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func $OPERATOR(_ value1: Parameter, and value2: Parameter) -> $CLAUSE {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .arrayOfParameter(array), condition: .$OPERATOR)
    }
EOF
            fi
       done
done
echo "}" >> ${OUTPUT_FILE}
done < $INPUT_BETWEEN_FILE


# Generate extensions for String and Parameter for LIKE and NOT LIKE operators

for TYPE in String Parameter; do
TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"

echo "public extension $TYPE {" >> ${OUTPUT_FILE}

    for CLAUSE_TYPE in Filter Having; do
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
    done
echo "}" >> ${OUTPUT_FILE}
done
