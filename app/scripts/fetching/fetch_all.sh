#!/usr/bin/env sh

# Get the directory of the script
SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

# Timeout 
TIMEOUT=30m

# Data fetching
# echo "============= FETCHING RADEM DATA =============" 
# timeout ${TIMEOUT} ${SCRIPTS_DIR}/fetch_radem.sh
# echo -e "\e[32mRADEM DATA FETCHED SUCCESSFULLY\e[0m"

echo "============= FETCHING IREM DATA =============" 
timeout ${TIMEOUT} ${SCRIPTS_DIR}/fetch_irem.sh
echo -e "\e[32mIREM DATA FETCHED SUCCESSFULLY\e[0m"

# Print "ok" in green
echo -e "\e[32m\e[0m"
