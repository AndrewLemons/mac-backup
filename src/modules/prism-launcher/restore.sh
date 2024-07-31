APPLICATION_SUPPORT_DIR="$HOME/Library/Application Support"
BACKUP_DIR="$1"
MODULE_NAME="prism-launcher"
RESTORE_FROM="$BACKUP_DIR/$MODULE_NAME"
RESTORE_TO="$APPLICATION_SUPPORT_DIR/PrismLauncher"

if [ ! -d "$RESTORE_FROM" ]; then
	echo "$MODULE_NAME: No backup found"
	exit 1
fi

echo "$MODULE_NAME: Restoring"

cd "$(dirname "$0")"

rclone sync --progress --stats-one-line "$RESTORE_FROM" "$RESTORE_TO"
