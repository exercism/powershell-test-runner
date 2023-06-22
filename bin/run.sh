#!/usr/bin/env sh

# Synopsis:
# Run the test runner on a solution.

# Arguments:
# $1: exercise slug
# $2: path to solution folder
# $3: path to output directory

# Output:
# Writes the test results to a results.json file in the passed-in output directory.
# The test results are formatted according to the specifications at https://github.com/exercism/docs/blob/main/building/tooling/test-runners/interface.md

# Example:
# ./bin/run.sh two-fer path/to/solution/folder/ path/to/output/directory/

# If any required arguments is missing, print the usage and exit
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "usage: ./bin/run.sh exercise-slug path/to/solution/folder/ path/to/output/directory/"
    exit 1
fi

slug="$1"
solution_dir=$(realpath "${2%/}")
output_dir=$(realpath "${3%/}")
results_file="${output_dir}/results.json"
capture_file="${output_dir}/capture"
junit_file="${output_dir}/output.xml"
test="${solution_dir}/$(jq -r '.files.test[0]' ${solution_dir}/.meta/config.json)"

# Create the output directory if it doesn't exist
mkdir -p "${output_dir}"

echo "${slug}: testing..."

pwsh -File "./bin/run.ps1" "${junit_file}" "${solution_dir}" "${test}"
pwsh -File "./bin/result.ps1" "${junit_file}"


#./bin/scaffold_json "${spec_file}" "${scaffold_file}"
#./bin/result_to_json "${capture_file}" "${junit_file}" "${scaffold_file}" "${results_file}"

echo "${slug}: done"