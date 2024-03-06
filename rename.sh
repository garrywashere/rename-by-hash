#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source_folder> <destination_folder>"
  exit 1
fi

source_folder="$1"
destination_folder="$2"

[ -d "$source_folder" ] || { echo "Source folder does not exist."; exit 1; }

[ -d "$destination_folder" ] || mkdir -p "$destination_folder"

for file in "$source_folder"/*.jpg; do
  md5sum_value=$(md5sum "$file" | awk '{print $1}')
  cp "$file" "$destination_folder/${md5sum_value}.jpg"
  echo "Copied: $file -> $destination_folder/${md5sum_value}.jpg"
done

echo "Done!"