# Variables
$backupPath          = "D:\exports\"
$todaysDateDirectory = $((Get-Date).ToString('yyy-MM-dd'))
$fullBackupPath      = $backupPath + $todaysDateDirectory

# Move to the storage drive
D:
# Move to the backup folder
cd $backupPath

#Check for the existance of full path with today's date
If (-NOT (Test-Path -Path $fullBackupPath) ) {
    
    # Create today's date directory.
    New-Item -ItemType Directory -Path ".\$dateDirectory"
}

#Backup all Hyper-V Guests on a standalone server
Get-VM | Export-VM -Path $fullBackupPath

#cd $fullBackupPath #This was for testing the dir
