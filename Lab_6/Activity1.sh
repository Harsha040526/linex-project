# Step 1: Create the backup folder
mkdir -p /tmp/backup

echo "Backup folder created at /tmp/backup"

# Step 2: Copy all C and Python program files into the backup folder
cp ~/*.c ~/*.py /tmp/backup 2>/dev/null
echo "Copied all C and Python files to /tmp/backup"

# Step 3: Navigate to /tmp folder
cd /tmp || exit
echo "Navigated to /tmp"

# Step 4: Compress the backup folder into a gzipped tar archive
TAR_FILE="backup-$(date +%Y-%m-%d).tar.gz"
tar -czf $TAR_FILE backup

echo "Compressed the backup folder into $TAR_FILE"

# Step 5: Mount the pendrive
udisksctl mount -b /dev/sdb1 # Adjust device name as necessary
echo "Mounted the pendrive"

# Step 6: Move the archive to the pendrive
mv $TAR_FILE /media/RVU/pendrive/
echo "Moved $TAR_FILE to /media/RVU/pendrive/"

# Step 7: Unmount the pendrive
udisksctl unmount -b /dev/sdb1
echo "Unmounted the pendrive"

# Step 8: Delete the backup folder
rm -rf /tmp/backup
echo "Deleted the backup folder"

echo "Backup and transfer process completed successfully."
