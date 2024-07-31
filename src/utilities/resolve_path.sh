resolve_path() {
	local base="$1"
	local path="$2"

	# If the path is already absolute, return it as is
	if [[ "$path" = /* ]]; then
		echo "$path"
	else
		# Otherwise, resolve the path relative to the base directory
		(cd "$base" && realpath "$path")
	fi
}