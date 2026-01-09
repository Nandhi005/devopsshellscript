#!/bin/bash

read -p "enter the directory you want to check or it will check under / directory:" DIR1
DIR="${DIR1:-/}"
echo "$(sudo find "${DIR}" -type f -exec du -h {} + 3> /dev/null| sort -hr | head -5)"

