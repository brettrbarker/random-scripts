#! /bin/bash
# Confirmation dialog
read -p "Are you sure you want to sort all pictures in this folder and subfolders? [y/n] " -n 1 -r
# move pictures into subfolders by year and month
# for each file in the folder "recovered_pictures"
for f in ./*; do
    # get the date of the picture
    date=$(exiftool -d "%Y-%m" -CreateDate $f | awk '{print $4}')
    # if the folder does not exist, create it
    if [ ! -d "./$date" ]; then
        mkdir ./$date
    fi
    # move the picture to the folder
    mv $f ./$date
    # show the status
    echo "Moved $f to ./$date"
done