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

INPUT_OPERATORS_FILE="${PKG_DIR}/Scripts/FilterAndHavingOperators.txt"
INPUT_TYPES_FILE="${PKG_DIR}/Scripts/FilterAndHavingTypes.txt"
INPUT_BOOL_FILE="${PKG_DIR}/Scripts/FilterAndHavingBool.txt"
INPUT_BETWEEN_FILE="${PKG_DIR}/Scripts/FilterBetweenInTypes.txt"
INPUT_BETWEEN__OPERATORS_FILE="${PKG_DIR}/Scripts/BetweenInOperators.txt"
INPUT_BETWEEN_EXTENSION_FILE="${PKG_DIR}/Scripts/FilterBetweenInExtension.txt"
INPUT_SUBQUERIES_OPERATORS_FILE="${PKG_DIR}/Scripts/SubqueriesOperators.txt"
INPUT_SUBQUERIES_TYPES_FILE="${PKG_DIR}/Scripts/SubqueriesTypes.txt"
INPUT_IN_SUBQUERY_TYPES_FILE="${PKG_DIR}/Scripts/InSelectTypes.txt"

OUTPUT_FILE="${PKG_DIR}/Sources/FilterAndHaving_GlobalFunctions.swift"

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

# Generate operators for simple conditions that return Filter and Having
while read -r LINE; do
    stringarray=($LINE)
    OPERATOR=${stringarray[0]}
    CASE=${stringarray[1]}
    while read -r LINE; do
        stringarray=($LINE)
        TYPE=${stringarray[0]}
        LHS_TYPE=${stringarray[1]}
        RHS_TYPE=${stringarray[2]}
        LHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${LHS_TYPE:0:1})${LHS_TYPE:1}"
        RHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${RHS_TYPE:0:1})${RHS_TYPE:1}"

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

    done < $INPUT_TYPES_FILE
done < $INPUT_OPERATORS_FILE

# Generate operators for Bool for simple conditions that return Filter and Having
while read -r LINE; do
    stringarray=($LINE)
    OPERATOR=${stringarray[0]}
    CASE=${stringarray[1]}
    TYPE=${stringarray[2]}
    LHS_TYPE=${stringarray[3]}
    RHS_TYPE=${stringarray[4]}
    LHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${LHS_TYPE:0:1})${LHS_TYPE:1}"
    RHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${RHS_TYPE:0:1})${RHS_TYPE:1}"

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

done < $INPUT_BOOL_FILE

# Generate extensions for Scalar/AggregateColumnExpression and Column for LIKE, BETWEEN, and IN operators
while read -r LINE; do
    stringarray=($LINE)
    CLAUSE_TYPE=${stringarray[0]}
    TYPE=${stringarray[1]}
    TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"


cat <<EOF >> ${OUTPUT_FILE}
public extension $TYPE {
    /// Create a \`$CLAUSE_TYPE\` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func like(_ pattern: String) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the LIKE operator with \`Parameter\`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as \`Parameter\`.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func like(_ pattern: Parameter) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .parameter(pattern), condition: .like)
    }

EOF
    for PARAM_TYPE in `sed '/^$/d' ${INPUT_BETWEEN_FILE} | sed '/^#/d'`; do
        PARAM_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${PARAM_TYPE:0:1})${PARAM_TYPE:1}"

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE_TYPE\` clause using the BETWEEN operator for $PARAM_TYPE.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func between(_ value1: $PARAM_TYPE, and value2: $PARAM_TYPE) -> $CLAUSE_TYPE {
        var array = [$PARAM_TYPE]()
        array.append(value1)
        array.append(value2)
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(array), condition: .between)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the NOT BETWEEN operator for $PARAM_TYPE.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func notBetween(_ value1: $PARAM_TYPE, and value2: $PARAM_TYPE) -> $CLAUSE_TYPE {
        var array = [$PARAM_TYPE]()
        array.append(value1)
        array.append(value2)
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(array), condition: .notBetween)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the IN operator for $PARAM_TYPE.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func \`in\`(_ values: $PARAM_TYPE...) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(values), condition: .in)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the NOT IN operator for $PARAM_TYPE.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func notIn(_ values: $PARAM_TYPE...) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .arrayOf$PARAM_TYPE(values), condition: .notIn)
    }
EOF
done < $INPUT_BETWEEN_FILE
echo "}" >> ${OUTPUT_FILE}
done < $INPUT_BETWEEN_EXTENSION_FILE

# Generate operators with subqueries, i.e. 'expression operator ANY/ALL(subquery)'
while read -r LINE; do
    stringarray=($LINE)
    OPERATOR=${stringarray[0]}
    CASE=${stringarray[1]}
    while read -r LINE; do
        stringarray=($LINE)
        TYPE=${stringarray[0]}
        LHS_TYPE=${stringarray[1]}
        RHS_TYPE=${stringarray[2]}
        LHS_TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${LHS_TYPE:0:1})${LHS_TYPE:1}"

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

# Generate extensions for IN, NOT IN with subquery

while read -r LINE; do
    stringarray=($LINE)
    CLAUSE=${stringarray[0]}
    TYPE=${stringarray[1]}
    TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"

echo "public extension $TYPE {" >> ${OUTPUT_FILE}

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE\` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func \`in\`(_ query: Select) -> $CLAUSE {
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .select(query), condition: .in)
    }

    /// Create a \`$CLAUSE\` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A \`$CLAUSE\` containing the clause.
    public func notIn(_ query: Select) -> $CLAUSE {
        return $CLAUSE(lhs: .$TYPE_LOWER(self), rhs: .select(query), condition: .notIn)
    }
EOF
echo "}" >> ${OUTPUT_FILE}
done < $INPUT_IN_SUBQUERY_TYPES_FILE

# Generate extensions for String and Parameter for the LIKE operator

for TYPE in String Parameter; do
TYPE_LOWER="$(tr '[:upper:]' '[:lower:]' <<< ${TYPE:0:1})${TYPE:1}"

echo "public extension $TYPE {" >> ${OUTPUT_FILE}

    for CLAUSE_TYPE in Filter Having; do

cat <<EOF >> ${OUTPUT_FILE}
    /// Create a \`$CLAUSE_TYPE\` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func like(_ pattern: String) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a \`$CLAUSE_TYPE\` clause using the LIKE operator with \`Parameter\`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as \`Parameter\`.
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func like(_ pattern: Parameter) -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .$TYPE_LOWER(self), rhs: .parameter(pattern), condition: .like)
    }

EOF
done
echo "}" >> ${OUTPUT_FILE}
done
