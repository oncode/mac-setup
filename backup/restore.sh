#!/usr/bin/env bash

###############################################################################
# Restore Backup
###############################################################################

set -e
echo 'Start restoring backup'

# move backup to downloads and unzip
mv "$BACKUP/backup.zip" ~/Downloads/backup.zip && cd ~/Downloads
7z x backup.zip

# import mysql dump
echo 'Import MySQL dump'
mysql -u 'root' -p < backup.sql

# config files
mv ./.ssh ~/.ssh
mv ./.docker ~/.docker
mv ./.vscode ~/.vscode
mv ./.slap ~/.slap
mv ./.subversion ~/.subversion
mv ./.httpie ~/.httpie
mv ./filezilla ~/.config/filezilla
mv ./.gitignore_global ~/.gitignore_global
mv ./.hgignore_global ~/.hgignore_global
mv ./n ~/n

# application data and preferences
mv ./User ~/Library/Application\ Support/Code/User
mv ./Banana.ch ~/Library/Application\ Support/Banana.ch
mv ./ch.banana.Banana.plist ~/Library/Preferences/ch.banana.Banana.plist
mv ./ch.banana.banana8.plist ~/Library/Preferences/ch.banana.banana8.plist

echo 'Restoring backup finished'
tput bel
