#!/usr/bin/env bash
set -e

###############################################################################
# Install/configure apps
###############################################################################

echo 'Start installing apps'

# get brew cask
brew tap caskroom/cask

brew install --cask docker
brew install --cask visual-studio-code
brew install --cask android-file-transfer
brew install --cask sourcetree
brew install --cask google-drive
brew install --cask vlc
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-edge
# brew install --cask grandtotal
# brew install --cask timings
# brew install --cask usage
brew install --cask keeweb
brew install --cask postman
brew install --cask sequel-pro
brew install --cask tableplus
brew install --cask skitch
brew install --cask sketch
brew install --cask imageoptim
brew install --cask slack
brew install --cask discord
brew install --cask balenaetcher
brew install --cask spotify
brew install --cask the-unarchiver
brew install --cask wkhtmltopdf
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask wireshark
brew install --cask disk-inventory-x
brew install --cask gas-mask
brew install --cask recordit
brew install --cask appcleaner
brew install --cask ccleaner
brew install --cask teamviewer
brew install --cask karabiner-elements
brew install --cask colour-contrast-analyser

# quicklook plugins
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask betterzip
brew install --cask qlimagesize
brew install --cask webpquicklook

# apple store apps
mas install 409201541 # Pages
# mas install 409203825 # Numbers
# mas install 409183694 # Keynote
# mas install 408981434 # iMovie
# mas install 595191960 # CopyClip

# docker images
docker pull php:7.1-apache
docker pull php:7.0-apache
docker pull php:5.6-apache
docker pull mysql
docker pull mariadb
docker pull postgres
docker pull mongo
docker pull redis

# prevent creating a backup of the files in the cloud
sudo tmutil addexclusion -p ~/My\ Drive
sudo tmutil addexclusion -p ~/Dropbox

# install also some fonts
brew tap homebrew/cask-fonts
brew install svn
brew install --cask font-dosis
brew install --cask font-open-sans
brew install --cask font-roboto
brew install --cask font-roboto-condensed
brew install --cask font-raleway
brew install --cask font-oswald
brew install --cask font-noto-sans
brew install --cask font-fontawesome
brew install --cask font-material-icons
brew install --cask font-materialdesignicons-webfont

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
