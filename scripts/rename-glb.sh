#!/bin/bash

# Set your root directory containing all building subfolders
BASE_DIR=~/HeroPractice/VGA/frontend/assets/models/characters

# Navigate to base directory
cd "$BASE_DIR" || { echo "Directory not found: $BASE_DIR"; exit 1; }

# Find and rename all .glb files recursively
find . -type f -name "*.glb" | while read -r file; do
  # Build the new name: lowercase + underscores
  dir=$(dirname "$file")
  base=$(basename "$file")
  newbase=$(echo "$base" | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g')
  newpath="$dir/$newbase"

  # Only rename if the name is changing
  if [[ "$file" != "$newpath" ]]; then
    mv "$file" "$newpath"
    echo "Renamed: $file -> $newpath"
  fi
done

