#!/bin/bash

BACKUP_DIR="/home/philip/source"
RESTORE_DIR="/home/philip/laba4"

LATEST_BACKUP=$(find "$BACKUP_DIR" -maxdepth 1 -type d -name "Backup-*" -printf "%P\n" | sort -r | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "No backups found."
    exit 1
fi

LATEST_BACKUP="$BACKUP_DIR/$LATEST_BACKUP"
mkdir -p "$RESTORE_DIR"

find "$LATEST_BACKUP" -type f ! -name "*.*.*" -exec cp {} "$RESTORE_DIR" \;

echo "Files restored to $RESTORE_DIR"
