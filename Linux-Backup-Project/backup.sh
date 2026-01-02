#!/bin/bash

# This checks if the number of arguments is correct If the number of
# arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory="$1"
destinationDirectory="$2"

# [TASK 2]
year=$(date +%y)
echo " The year is $year"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=$(pwd)

# [TASK 6] - Get the absolute path of the destination directory
cd "$destinationDirectory" || exit
destAbsPath=$(pwd)

# [TASK 7] - Return to original directory, then move to the target directory
cd "$origAbsPath" || exit
cd "$targetDirectory" || exit

# [TASK 8] - Calculate the timestamp for 24 hours ago (86400 seconds)
yesterdayTS=$((currentTS - 86400))

declare -a toBackup

# [TASK 9] -
for file in $(ls)
do
  # [TASK 10] -
  if [[ $(date -r "$file" +%s) -gt $yesterdayTS ]]
  then
    # [TASK 11]
    toBackup+=("$file")
  fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
mv $backupFileName "$destAbsPath"

# ... (your existing tar command) ...

echo "------------------------------------------"
echo "Backup Process Completed Successfully!"
echo "Archive Name: $backupFileName"
echo "Location: $destAbsPath"
echo "Disk Space Check:"
df -h / | awk 'NR==2 {print "Total Available: " $4 " (Used: " $5 ")"}'
echo "------------------------------------------"