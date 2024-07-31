BACKUP_DIR="$1"
MODULE_NAME="documents"
BACKUP_FROM="$HOME/Documents"
BACKUP_TO="$BACKUP_DIR/$MODULE_NAME"

if [ ! -d "$BACKUP_FROM" ]; then
	echo "$MODULE_NAME: Not found"
	exit 1
fi

echo "$MODULE_NAME: Backing up"

cd "$(dirname "$0")"

rclone sync --progress --stats-one-line --exclude-from=ignore.txt --delete-excluded "$BACKUP_FROM" "$BACKUP_TO"