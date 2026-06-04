#!/bin/bash

SCAN_ID=23

while true
do
    STATUS=$(curl -sk \
    -H "X-ApiKeys: accessKey=dbc8cc6059171ddc67abb718477b9115d29f3cacecd2f4c9e5412f47f23cd695; secretKey=34492690d49059d96fbfe5f6188b22621d787ac1adb8d1579a47995878e1c876" \
    https://tharsan-virtualbox:8834/scans/$SCAN_ID | jq -r '.info.status')

    echo "Current Status: $STATUS"

    if [ "$STATUS" = "completed" ]; then
        echo "Scan completed."
        break
    fi

    sleep 30
done
