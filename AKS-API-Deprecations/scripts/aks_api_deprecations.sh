#!/bin/bash

# Output file
output_file="aks_api_usage_report.txt"

# Array of API versions to check
api_versions=(
    "2022-07-02-preview"
    "2022-08-02-preview"
    "2022-08-03-preview"
    "2022-09-02-preview"
    "2022-10-02-preview"
    "2022-11-02-preview"
    "2023-01-02-preview"
    "2023-02-02-preview"
    "2023-03-02-preview"
    "2023-04-02-preview"
    "2023-05-02-preview"
    "2023-06-02-preview"
    "2023-07-02-preview"
    "2023-08-02-preview"
)

# Function to check API usage
check_api_usage() {
    local api_version=$1
    echo "Checking usage for API version: $api_version" >> "$output_file"
    az monitor activity-log list --offset 30d --max-events 10000 --namespace microsoft.containerservice --query "[?eventName.value == 'EndRequest' && contains(not_null(httpRequest.uri,''), '${api_version}')]" >> "$output_file"
}

# Clear the output file if it exists
> "$output_file"

# Loop through each API version and check usage
for version in "${api_versions[@]}"; do
    check_api_usage "$version"
    echo "----------------------------------------" >> "$output_file"
done

echo "Report generated in $output_file"