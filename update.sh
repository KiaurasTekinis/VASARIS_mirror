#!/bin/sh

readonly OUT_DIR=./vasaris/
readonly URL_LIST_FILE=./url_list.txt

wget -N --input-file $URL_LIST_FILE -P $OUT_DIR --no-if-modified

if ! git diff-index --quiet HEAD --; then
    COMMIT_MESSAGE=$(git diff --shortstat)
    git add $OUT_DIR
    git commit -m "$COMMIT_MESSAGE"
    git push
fi
