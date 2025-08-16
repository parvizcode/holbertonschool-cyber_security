#!/bin/bash

# Check if domain is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"
output_file="${domain}.csv"

# Perform whois and extract Registrant, Admin, Tech info
whois "$domain" | awk -F': ' '
    BEGIN { print "Type,Name,Value" }  # CSV header (optional)
    /Registrant |Admin |Tech / {
        # Remove leading/trailing spaces
        gsub(/^[ \t]+|[ \t]+$/, "", $1);
        gsub(/^[ \t]+|[ \t]+$/, "", $2);
        # Replace spaces with $ in value (if needed)
        # gsub(/ /, "$", $2);
        # Print as CSV
        print $1 "," $2
    }' > "$output_file"

echo "Whois data saved to $output_file"
