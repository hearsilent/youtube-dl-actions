#!/bin/sh

UPLOAD_TO="YouTube"
UPLOAD_FROM=`youtube-dl -i --get-filename -o '%(title)s.%(ext)s' https://www.youtube.com/watch?v=T4SimnaiktU`
echo $UPLOAD_FROM

curl -X POST \
    -H "Authorization: Bearer $GOOGLE_DRIVE_ACCESS_TOKEN" \
    -F "metadata={name : '$UPLOAD_FROM', parents: ['$UPLOAD_TO']};type=application/json;charset=UTF-8" \
    -F "file=@$UPLOAD_FROM;type=video/mp4" \
    "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"