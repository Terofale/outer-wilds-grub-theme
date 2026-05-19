#!/bin/bash

# This is half vibecoded it may or may not break your grub install 
# You can just manually edit the grub.cfg if you want

INPUT_FILE="/boot/grub/grub.cfg"
OUTPUT_FILE="/boot/grub/grub.cfg"

# Check dependencies
INSTALLER_DEPENDENCIES=(
    'mktemp'
    'sed'
    'sudo'
    'tee'
)

for i in "${INSTALLER_DEPENDENCIES[@]}"; do
    command -v $i > /dev/null 2>&1 || {
        echo >&2 "'$i' command is required, but not available. Aborting.";
        exit 1;
    }
done

# Pre-authorise sudo
sudo echo

# Temporary output file
TEMP_FILE=$(mktemp)

if [ ! -f "$INPUT_FILE" ]; then
    echo "file $INPUT_FILE doesn't exit. Aborting."
    exit 1
fi

while IFS= read -r line <&3; do
    current_name=""

    if echo "$line" | grep -qE '^[[:space:]]*(menuentry|submenu) '; then
    current_name=$(echo "$line" | grep -Po "(menuentry|submenu) '\K[^']+")
fi

    if [ -n "$current_name" ]; then
        echo ""
        echo "Current entry: \"$current_name"
        

        IFS= read -e -i "$current_name" -p "New entry:     \"" new_name

        if [ -n "$new_name" ]; then
            modified_line="${line//\'$current_name\'/\'$new_name\'}"
            echo "$modified_line" >> "$TEMP_FILE"
        else
            echo "$line" >> "$TEMP_FILE"
            echo "Not changed (empty line is invalid)"
        fi
    else
        echo "$line" >> "$TEMP_FILE"
    fi

done 3< "$INPUT_FILE"

sudo cp "$TEMP_FILE" "$OUTPUT_FILE"
rm -f "$TEMP_FILE"

echo ""
echo "Done"
