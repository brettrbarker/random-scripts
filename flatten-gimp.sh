# Bash Script to Open all .xcf files in a directory and save them as .png
# Requires GIMP to be installed
# Usage: ./flatten-gimp.sh /path/to/directory

# Check if GIMP is installed
if ! [ -x "$(command -v gimp)" ]; then
  echo 'Error: GIMP is not installed.' >&2
  exit 1
fi

# Check if a directory was passed
if [ -z "$1" ]; then
  echo "Error: No directory passed." >&2
  exit 1
fi

# Check if the directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory does not exist." >&2
  exit 1
fi

# Loop through all .xcf files in the directory
for file in "$1"/*.xcf; do
  # Check if the file is a .xcf file
  if [[ "$file" == *.xcf ]]; then
    # Open the file in GIMP and save it as a .png
    gimp -i -b '(gimp-file-save RUN-NONINTERACTIVE "'$file'" "'$file'.png" "(png-save RUN-NONINTERACTIVE \"compression\" 0)")' -b '(gimp-quit 0)'
  fi
done

# End of Script