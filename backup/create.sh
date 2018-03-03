#!/usr/bin/env bash

###############################################################################
# Create Backup
###############################################################################

set -e
echo 'Start creating backup'

cd "$BACKUP"

# backup mysql dump
echo 'Create MySQL dump'
mysqldump --all-databases -u 'root' -p > "$BACKUP/backup.sql"
7z a backup.zip backup.sql
rm -f backup.sql
# keep a list of all installed applications
ls -1 /Applications >> apps.txt
7z a backup.zip apps.txt
rm -f apps.txt
# keep a list of all installed vscode extensions
code --list-extensions >> code.txt
7z a backup.zip code.txt
rm -f code.txt

# config files
7z a backup.zip ~/.ssh
7z a backup.zip ~/.docker
7z a backup.zip ~/.vscode
7z a backup.zip ~/.subversion
7z a backup.zip ~/.slap
7z a backup.zip ~/.httpie
7z a backup.zip ~/.config/filezilla
7z a backup.zip ~/.gitignore_global
7z a backup.zip ~/.hgignore_global
7z a backup.zip ~/n

# application data and preferences
7z a backup.zip ~/Library/Application\ Support/Code/User
7z a backup.zip ~/Library/Application\ Support/Banana.ch
7z a backup.zip ~/Library/Preferences/ch.banana.Banana.plist
7z a backup.zip ~/Library/Preferences/ch.banana.banana8.plist

echo 'Creating backup finished'
tput bel
