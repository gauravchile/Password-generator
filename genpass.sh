#!/usr/bin/env bash

# Usage: ./genpass.sh <username> <length>
# Example: ./genpass.sh gaurav 12

username=$1
length=$2

if [[ -z "$username" || -z "$length" ]]; then
  echo "Usage: $0 <username> <length>"
  exit 1
fi

# Shuffle username
shuffled=$(echo "$username" | fold -w1 | shuf | tr -d '\n')

# Generate random digits
digits=$(cat /dev/urandom | tr -dc '0-9' | head -c 10)

# Combine shuffled username + random digits
base="${shuffled}${digits}"

# Trim to requested length
password=$(echo "$base" | cut -c1-"$length")

echo "$password"

