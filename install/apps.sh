#!/usr/bin/env bash
set -e

###############################################################################
# Install/configure apps
###############################################################################

echo 'Start installing apps'

# get brew cask
brew tap caskroom/cask

brew cask install docker
brew cask install visual-studio-code
brew cask install android-file-transfer
brew cask install java
brew cask install filezilla
brew cask install sourcetree
brew cask install google-backup-and-sync
brew cask install dropbox
brew cask install vlc
brew cask install google-chrome
brew cask install firefox
brew cask install grandtotal
brew cask install timings
brew cask install keeweb
brew cask install postman
brew cask install sequel-pro
brew cask install tableplus
brew cask install skitch
brew cask install sketch
brew cask install slack
brew cask install discord
brew cask install spectacle
brew cask install spotify
brew cask install free-ruler
brew cask install the-unarchiver
brew cask install wkhtmltopdf
brew cask install virtualbox
brew cask install wireshark
brew cask install disk-inventory-x
brew cask install dash
brew cask install fontplop
brew cask install recordit
brew cask install hyperdock
brew cask install appcleaner
brew cask install ccleaner
brew cask install teamviewer

# quicklook plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install betterzip
brew cask install qlimagesize
brew cask install webpquicklook

# apple store apps
mas install 409201541 # Pages
mas install 409203825 # Numbers
mas install 409183694 # Keynote
mas install 408981434 # iMovie
mas install 595191960 # CopyClip

# prevent creating a backup of the files in the cloud
sudo tmutil addexclusion -p ~/Google\ Drive
sudo tmutil addexclusion -p ~/Dropbox

# install also some fonts
brew tap caskroom/fonts
brew cask install font-open-sans
brew cask install font-roboto
brew cask install font-roboto-condensed
brew cask install font-raleway
brew cask install font-oswald
brew cask install font-noto-sans
brew cask install font-fontawesome
brew cask install font-material-icons
brew cask install font-materialdesignicons-webfont

# disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# maeke chrome default browser
open -a 'Google Chrome' --args --make-default-browser

echo 'Finished installing apps'
tput bel
