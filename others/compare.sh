#!/bin/bash
shopt -s extglob

DIR1=/home/$(whoami)/scripts/fonts
DIR2=/home/$(whoami)/.local/share/fonts

compare_files() {
  # Iterate over each file in DIR1
  for file1 in "$DIR1"/*; do
    # Extract just the filename (basename)
    filename=$(basename "$file1")
    # Construct the full path for the corresponding file in DIR2
    file2="$DIR2/$filename"

    # Use an 'if' statement to check if the file exists in DIR2
    if [[ -f "$file2" ]]; then
      echo "Match found: $filename"
      # Optional: You can add an extra comparison here using 'cmp' or 'diff'
      # to check if the file *contents* are the same
      if cmp --quiet "$file1" "$file2"; then
        echo "Contents are identical for $filename"
      # else
      fi
    else
      cp -v -r /home/$(whoami)/scripts/fonts/$filename /home/$(whoami)/.local/share/fonts
    fi
  done
}

compare_files
