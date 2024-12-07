#!/bin/bash

SOURCE_DIR="/home/philip/laba4"
BACKUP_DIR="/home/philip/source"
BACKUP_REPORT="$BACKUP_DIR/backup-report"
TODAY=$(date +%Y-%m-%d)

LATEST_BACKUP=$(find "$BACKUP_DIR" -maxdepth 1 -type d -name "Backup-*" -printf "%P\n" | sort -r | head -1)
LATEST_DATE=$(echo "$LATEST_BACKUP" | sed 's/Backup-//')
DATE_DIFF=$(( ($(date -d "$TODAY" +%s) - $(date -d "$LATEST_DATE" +%s)) / 86400 ))

if [ -z "$LATEST_BACKUP" ] || [ "$DATE_DIFF" -ge 7 ]; then
    NEW_BACKUP="$BACKUP_DIR/Backup-$TODAY"
    mkdir "$NEW_BACKUP"

    cp -r "$SOURCE_DIR/"* "$NEW_BACKUP/"
    echo "Backup created: $NEW_BACKUP on $TODAY" >> "$BACKUP_REPORT"
    ls "$SOURCE_DIR" >> "$BACKUP_REPORT"
else
    echo "Using existing backup: $LATEST_BACKUP"

    for FILE in "$SOURCE_DIR"/*; do
        BASENAME=$(basename "$FILE")
        DEST_FILE="$BACKUP_DIR/$LATEST_BACKUP/$BASENAME"

        if [ ! -f "$DEST_FILE" ]; then
            cp "$FILE" "$DEST_FILE"
            echo "$BASENAME added" >> "$BACKUP_REPORT"
        else
            if [ "$(stat -c%s "$FILE")" != "$(stat -c%s "$DEST_FILE")" ]; then
                mv "$DEST_FILE" "$DEST_FILE.$TODAY"
                cp "$FILE" "$DEST_FILE"
                echo "$BASENAME updated, old version: $BASENAME.$TODAY" >> "$BACKUP_REPORT"
            fi
        fi
    done
fi
