# Mac Setup

My personal Mac backup/installation/restore/update process for a clean Mac installation.

## Install the Magic

```bash
# configure google drive as backup directory
echo export BACKUP=~/Google\ Drive/Privat/Software/Backup >> ~/.bash_profile
# configure path to bash stuff
echo export BASH_STUFF=~/.bash_stuff >> ~/.bash_profile
# create the bash stuff folder
mkdir "$BASH_STUFF" && cd "$BASH_STUFF"
# clone this repo into bash stuff folder
git clone https://github.com/oncode/mac-setup.git
```

## Backup Current Data

Run following script to create `backup.zip` inside the backup folder:

```bash
source "$BASH_STUFF/mac-setup/backup/create.sh"
```

### Contents

- SQL dump
- SSH keys
- config data from important apps
- list with installed apps
- list with installed vs code exensions

## Setup Clean Mac

### Auto Installation

```bash
# run os configuration (requires sudo)
source "$BASH_STUFF/mac-setup/install/config.sh"

# install dev tools
source "$BASH_STUFF/mac-setup/install/dev.sh"

# install bash tools
source "$BASH_STUFF/mac-setup/install/bash.sh"

# install apps
source "$BASH_STUFF/mac-setup/install/apps.sh"

# restore backup
source "$BASH_STUFF/mac-setup/backup/restore.sh"
```


### Manual Steps

1. Install following Apps:

    - Airmail
    - Photoshop / Illustrator / InDesign
    - Microsoft Office
    - Open Office (cask seems to be broken)
    - Fenêtre
    - uTorrent

2. Install Terminal profile

    - `open $BASH_STUFF/mac-setup/install/Pro.terminal`
    - Choose as default: "Shell" -> "Als Standard verwenden"

3. Open programms, add licences and change configuration where needed (see also [`tweakings`](tweakings) folder)
4. Change wallpaper to wallpaper.jpg
4. Install MacOS updates (if any available)
5. Restart Mac

    - `sudo shutdown -r now "Let the work begin..."`

6. Start first Time Machine Backup

    - `tmutil startbackup`

## Update

There is an update script to keep the Mac fresh. Just run:

```bash
source "$BASH_STUFF/mac-setup/update.sh"
```
