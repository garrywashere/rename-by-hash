#!/bin/bash

source_folder="./original"
destination_folder="./renamed"

[ -d "$source_folder" ] || { echo "Source folder does not exist."; exit 1; }
[ -d "$destination_folder" ] || mkdir -p "$destination_folder"

for file in "$source_folder"/*.jpg; do
  md5sum_value=$(md5sum "$file" | awk '{print $1}')
  cp "$file" "$destination_folder/${md5sum_value}.jpg"
  echo "Copied: $file -> $destination_folder/${md5sum_value}.jpg"
done

echo "Done!"

