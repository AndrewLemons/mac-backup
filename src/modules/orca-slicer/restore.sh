APPLICATION_SUPPORT_DIR="$HOME/Library/Application Support"
BACKUP_DIR="$1"
MODULE_NAME="orca-slicer"
RESTORE_FROM="$BACKUP_DIR/$MODULE_NAME"
RESTORE_TO="$APPLICATION_SUPPORT_DIR/OrcaSlicer"

if [ ! -d "$RESTORE_FROM" ]; then
	echo "$MODULE_NAME: No backup found"
	exit 1
fi

echo "$MODULE_NAME: Restoring"

cd "$(dirname "$0")"

rclone copy --progress --stats-one-line --update "$RESTORE_FROM" "$RESTORE_TO"
