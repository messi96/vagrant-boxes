#!/bin/bash

set -o nounset
set -o errexit

S3_BUCKET="waratek-vagrant-boxes"

which s3cmd > /dev/null
if [[ $? -ne 0 ]] ; then
    echo "I don't know how to run s3cmd"
    exit 1
fi

if [[ -n "$( ls *.box 2> /dev/null )" ]] ; then
    echo -e "\n[*] Uploading boxes to S3\n"
    s3cmd -v -P --no-delete-removed -m "application/octet-stream" sync *.box s3://${S3_BUCKET}

    echo -e "\n[*] Calculating box md5sums"
    for box in *.box ; do
        md5sum $box > ${box}.md5
    done

    echo -e "\n[*] Uploading md5sums to S3\n"
    s3cmd -v -P --no-delete-removed -m "text/plain" sync *.md5 s3://${S3_BUCKET}

    echo -e "\n[*] Done\n"
else
    echo "[*] Nothing to do"
fi
