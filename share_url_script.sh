#!/bin/bash

read -p "Enter the bucket name (e.g., myBucket/myFolder): " BUCKET
read -p "Enter the file name (e.g., example.mp4): " FILE_NAME

if [[ -z "$BUCKET" || -z "$FILE_NAME" ]]; then
  echo "Both bucket name and file name are required."
  exit 1
fi

mc cp "$FILE_NAME" "$BUCKET/"
if [ $? -ne 0 ]; then
  echo "Failed to upload $FILE_NAME to $BUCKET."
  exit 1
fi
echo "File $FILE_NAME uploaded to $BUCKET."

SHARE_URL=$(mc share download "$BUCKET/$FILE_NAME" | grep -o "http[^ ]*" | tail -n 1)
if [ -z "$SHARE_URL" ]; then
  echo "Failed to generate presigned URL for $FILE_NAME in $BUCKET."
  exit 1
fi

echo "Share URL: $SHARE_URL"