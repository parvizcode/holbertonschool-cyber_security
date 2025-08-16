#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"
output_file="${domain}.csv"

whois "$domain" | awk -F': ' -v domain="$domain" '
    BEGIN { print "Type,Value" }
    /Registrant|Admin|Tech/ && /Organization|State\/Province|Country|Email/ {
        gsub(/^[ \t]+|[ \t]+$/, "", $1);
        gsub(/^[ \t]+|[ \t]+$/, "", $2);
        if ($1 ~ /Email/) {
            print $1 "," $2 "https://domains.markmonitor.com/whois/" domain
        } else {
            print $1 "," $2
        }
    }' > "$output_file"

echo "Whois data saved to $output_file"
