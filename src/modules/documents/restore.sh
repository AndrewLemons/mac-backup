BACKUP_DIR="$1"
MODULE_NAME="documents"
RESTORE_FROM="$BACKUP_DIR/$MODULE_NAME"
RESTORE_TO="$HOME/Documents"

if [ ! -d "$RESTORE_FROM" ]; then
	echo "$MODULE_NAME: No backup found"
	exit 1
fi

echo "$MODULE_NAME: Restoring"

cd "$(dirname "$0")"

rclone copy --progress --stats-one-line --update "$RESTORE_FROM" "$RESTORE_TO"
