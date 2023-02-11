#! /bin/bash
# find_pictures.sh
# find all pictures in a folder and subfolders
# and move them to a folder named "recovered_pictures"
# if the folder does not exist, create it
# if the folder exists, move the pictures to it

# get the current directory
dir=$(pwd)
printf "Current directory: $dir"
# Show confirmation dialog
read -p "Are you sure you want to move all pictures to a folder named 'recovered_pictures'? [y/n] " -n 1 -r
# if the folder does not exist, create it
if [ ! -d "$dir/recovered_pictures" ]; then
    mkdir $dir/recovered_pictures
fi
# find all pictures in the current directory and subdirectories that are bigger than 1MB
# and move them to the folder "recovered_pictures" and show the status
find $dir -type f -name "*.jpg" -size +1M -exec mv {} $dir/recovered_pictures \; -exec echo "Moved {} to $dir/recovered_pictures" \; 

# move pictures into subfolders by year and month
# for each file in the folder "recovered_pictures"
for f in $dir/recovered_pictures/*; do
    # get the date of the picture
    date=$(exiftool -d "%Y-%m" -CreateDate $f | awk '{print $4}')
    # if the folder does not exist, create it
    if [ ! -d "$dir/recovered_pictures/$date" ]; then
        mkdir $dir/recovered_pictures/$date
    fi
    # move the picture to the folder
    mv $f $dir/recovered_pictures/$date
    # show the status
    echo "Moved $f to $dir/recovered_pictures/$date"
done

