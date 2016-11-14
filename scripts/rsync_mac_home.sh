#!/bin/bash

# Hackjob script to backup my important directories

# Set the rsync command
RSYNC="time rsync -va --progress --delete --exclude=.DS_Store"

# set the destination directory
DEST="/Volumes/backup/rsync"

# which directories do you want to copy?
declare -a DIRS=("Box Sync" "Downloads" "Dropbox" "Movies" "Music" "Pictures" "bin")

# need to be in home directory
cd ~

# Check that the directories exist
for i in "${DIRS[@]}"
do 
  if [ ! -d "$i" ]; then 
    echo "$i doesn't exist"; exit 1; 
  fi
done

# Echo the entire command to stdout. | bash to run.
echo "# pipe to bash to run (... | bash):"
echo "$RSYNC $(printf "'%s' " "${DIRS[@]}") $DEST"
