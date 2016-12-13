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

OUTPUT_FILE="${PKG_DIR}/Sources/FilterAndHaving_Extensions.swift"

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

# Generate extensions for Filter and Having for IS (NOT) NULL operators

for CLAUSE_TYPE in Filter Having; do
cat <<EOF >> ${OUTPUT_FILE}
public extension $CLAUSE_TYPE {
EOF
    for OPERATOR in isNull isNotNull; do

cat <<EOF >> ${OUTPUT_FILE}

    /// Create a \`$CLAUSE_TYPE\` clause using the $OPERATOR operator.
    ///
    /// - Returns: A \`$CLAUSE_TYPE\` containing the clause.
    public func $OPERATOR() -> $CLAUSE_TYPE {
        return $CLAUSE_TYPE(lhs: .clause(self), condition: .$OPERATOR)
    }
EOF
    done
echo "}" >> ${OUTPUT_FILE}
done
