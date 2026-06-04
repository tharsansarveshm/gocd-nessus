#!/bin/bash

SCAN_ID=23

FILE_ID=$(curl -sk -X POST \
-H "Content-Type: application/json" \
-H "X-ApiKeys: accessKey=dbc8cc6059171ddc67abb718477b9115d29f3cacecd2f4c9e5412f47f23cd695; secretKey=34492690d49059d96fbfe5f6188b22621d787ac1adb8d1579a47995878e1c876" \
-d '{"format":"html"}' \
https://tharsan-virtualbox:8834/$SCAN_ID/export | jq -r '.file')

echo "Export file ID: $FILE_ID"

sleep 20

curl -sk \
-H "X-ApiKeys: accessKey=dbc8cc6059171ddc67abb718477b9115d29f3cacecd2f4c9e5412f47f23cd695; secretKey=34492690d49059d96fbfe5f6188b22621d787ac1adb8d1579a47995878e1c876" \
https://tharsan-virtualbox:8834/scans/$SCAN_ID/export/$FILE_ID/download \
-o reports/nessus-report.html

echo "Report downloaded to reports/nessus-report.html"
