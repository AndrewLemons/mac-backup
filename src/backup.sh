BASE_DIR="$(pwd)"
source "$BASE_DIR/src/utilities/resolve_path.sh"

ARG_1="$1"
if [ -z "$ARG_1" ]; then
	echo "Usage: $0 <backup_dir>"
	exit 1
fi

BACKUP_DIR="$(resolve_path "$BASE_DIR" "$ARG_1")"

echo "Backing up to $BACKUP_DIR"

find ./src/modules -name "backup.sh" -exec sh {} "$BACKUP_DIR" \;
