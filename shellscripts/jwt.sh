#!/bin/bash

# Check if JWT is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <JWT>"
  exit 1
fi

# Split JWT into parts
jwt=$1
header=$(echo "$jwt" | cut -d '.' -f1)
payload=$(echo "$jwt" | cut -d '.' -f2)
signature=$(echo "$jwt" | cut -d '.' -f3)

# Decode Base64 URL to readable JSON
decode_base64_url() {
  echo "$1" | tr '_-' '/+' | base64 -d 2>/dev/null | jq .
}

echo ""
echo "Header:"
decode_base64_url "$header"

echo -e "\nPayload:"
decode_base64_url "$payload"

echo -e "\nSignature:"
echo "$signature"
