#!/bin/bash

wget -P required_files https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip && unzip -d /home/$(whoami)/scripts/fonts/ required_files/FiraCode.zip
wget -P required_files https://font.download/dl/font/gugi.zip && unzip -d /home/$(whoami)/scripts/fonts/ required_files/gugi.zip

sleep 1s

DIR1=/home/$(whoami)/scripts/fonts
DIR2=/home/$(whoami)/.local/share/fonts/

creating_directory() {
  # Creating directory that does not exists
  if [[ ! -d "$DIR1" ]]; then
    mkdir "$DIR1"
    echo " Folder '$DIR1' created. "
  else
    echo " Folder '$DIR1' already exists"

  fi

  if [[ ! -d "$DIR2" ]]; then
    mkdir "$DIR2"
    echo " Folder '$DIR2' created. "
  else
    echo " Folder '$DIR2' already exists"

  fi
}

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

sleep 0.5

# Check if directories exist
if [[ ! -d "$DIR1" ]] || [[ ! -d "$DIR2" ]]; then
  echo "Error: One or both directories not found. Creating directories"
  creating_directory
#else
# echo "--- Matching files found in both directories ---"
fi
#echo " ____ Copying fonts to local/fonts ____ "
#mv -v /home/$(whoami)/scripts/fonts/* /home/$(whoami)/.local/share/fonts
#echo " Move successful "

compare_files
