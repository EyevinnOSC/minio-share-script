#!/bin/bash

read -p "Enter the bucket name (e.g., myBucket/myBucketFolder): " BUCKET

read -p "Enter the file name (e.g., example.mp4): " FILE_NAME

if [[ -z "$BUCKET" || -z "$FILE_NAME" ]]; then
  echo "Both bucket name and file name are required."
  exit 1
fi

JSON_FILE="${FILE_NAME}_share.json"

SHARE_URL=$(mc share download "$BUCKET/$FILE_NAME" | grep -o "http[^ ]*" | tail -n 1)

if [ -z "$SHARE_URL" ]; then
  echo "Failed to generate presigned URL for $BUCKET/$FILE_NAME"
  exit 1
fi

echo "{ \"file\": \"$FILE_NAME\", \"url\": \"$SHARE_URL\" }" > "$JSON_FILE"
echo "Presigned URL saved in $JSON_FILE"

mc cp "$JSON_FILE" "$BUCKET/"

if [ $? -eq 0 ]; then
  echo "JSON file uploaded to $BUCKET/"
else
  echo "Failed to upload $JSON_FILE to $BUCKET/"
  exit 1
fi

rm -f "$JSON_FILE"