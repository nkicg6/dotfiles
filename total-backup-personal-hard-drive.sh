# script to sync two hard drives

# personal to lab
echo '[INFO] Synching personal to lab'
#rsync -v -a -u /Volumes/NICK_HD/RESTREPOLAB/images/ /Volumes/LABONE/images/
# New hard drive 2018-06-09
# Exclude . files with --exclude=".*" 2018-08-16
rsync -v -a -u --max-size=3.9G --exclude=".*" /Volumes/Nickdata/ /Volumes/LABTWO/backup_personal_hd/
echo '[INFO] DONE!'
# personal data to lab
