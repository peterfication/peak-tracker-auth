#!/bin/bash

# This script checks that all subscribers are being published to.
#
# If you subscribe to a new message that has no publisher yet, this script will fail.

publishers=$(find app config lib -type f -name "*.rb" -exec grep -oP '(?<=MessageBus\.publish ")[^"]*|(?<=MessageBus\.publish\(")[^"]*' {} \;)
subscribers=$(find app config lib -type f -name "*.rb" -exec grep -oP '(?<=MessageBus\.subscribe ")[^"]*|(?<=MessageBus\.subscribe\(")[^"]*' {} \;)

if [[ $publishers == *"$subscribers"* ]]; then
  echo "All good"
  exit 0;
else
  echo "There are subscribers that are not being published to:"
  echo "$publishers" > temp_output1.txt
  echo "$subscribers" > temp_output2.txt
  diff temp_output1.txt temp_output2.txt
  rm temp_output1.txt temp_output2.txt
  exit 1;
fi
