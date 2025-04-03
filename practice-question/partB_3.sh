#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <output_file>"
    exit 1
fi

dir="$1"
output="$2"

if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' does not exist."
    exit 1
fi

tar -czf "$output" "$dir"
echo "Directory '$dir' compressed into '$output'"
