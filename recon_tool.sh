0#!/bin/bash

# Professional Recon Tool by Yousef Nossier
# Usage: ./recon_tool.sh example.com

TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Please provide a target domain. Example: ./recon_tool.sh google.com"
    exit 1
fi

echo "--- Starting Security Scan for: $TARGET ---"

# 1. Checking HTTP Headers
echo "[+] Analyzing Security Headers..."
curl -I -s $TARGET > headers.txt

# 2. DNS Records Lookup
echo "[+] Gathering DNS Records..."
dig $TARGET ANY +noall +answer > dns_records.txt

# 3. Whois Information
echo "[+] Fetching WHOIS data..."
whois $TARGET | grep -E "Admin Email|Registrar|Creation Date" > info.txt

echo "--- Scan Finished. Reports saved to txt files. ---"
