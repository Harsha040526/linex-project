#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

process_name="$1"
pkill -9 "$process_name"

if [ $? -eq 0 ]; then
    echo "Process '$process_name' terminated."
else
    echo "Failed to terminate process '$process_name'."
fi
