#!/usr/bin/env bash
set -e

###############################################################################
# Install/configure apps
###############################################################################

echo 'Start installing apps'

# get brew cask
brew tap caskroom/cask

brew install --cask pgadmin4
brew install --cask dbeaver-community
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask android-file-transfer
brew install --cask java
brew install --cask filezilla
brew install --cask sourcetree
brew install --cask google-backup-and-sync
brew install --cask dropbox
brew install --cask vlc
brew install --cask google-chrome
brew install --cask firefox
brew install --cask grandtotal
brew install --cask timings
brew install --cask usage
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask android-file-transfer
brew install --cask sourcetree
brew install --cask google-drive
brew install --cask vlc
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-edge
brew install --cask keeweb
brew install --cask postman
brew install --cask sequel-pro
brew install --cask tableplus
brew install --cask skitch
brew install --cask sketch
brew install --cask imageoptim
brew install --cask slack
brew install --cask discord
brew install --cask etcher
brew install --cask spectacle
brew install --cask spotify
brew install --cask free-ruler
brew install --cask balenaetcher
brew install --cask spotify
brew install --cask the-unarchiver
brew install --cask wkhtmltopdf
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask wireshark
brew install --cask disk-inventory-x
brew install --cask gas-mask
brew install --cask fontplop
brew install --cask recordit
brew install --cask hyperdock
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

# install dash with cheatsheets stack overflow and user contributes stuff
brew install --cask dash
open "dash-install://repo_name=Cheat Sheets&entry_name=Git"
open "dash-install://repo_name=Cheat Sheets&entry_name=Docker"
open "dash-install://repo_name=Cheat Sheets&entry_name=Dockerfile"
open "dash-install://repo_name=Cheat Sheets&entry_name=Licenses"
open "dash-install://repo_name=Cheat Sheets&entry_name=npm"
open "dash-install://repo_name=Cheat Sheets&entry_name=Regular Expressions"
open "dash-install://repo_name=Cheat Sheets&entry_name=Chrome Developer Tools"
open "dash-install://repo_name=Cheat Sheets&entry_name=HTML Entities"
open "dash-install://repo_name=Cheat Sheets&entry_name=HTML Head Elements"
open "dash-install://repo_name=Cheat Sheets&entry_name=HTTP Header Fields"
open "dash-install://repo_name=Cheat Sheets&entry_name=HTTP Status Codes"
open "dash-install://repo_name=Cheat Sheets&entry_name=Mac Startup Keys"
open "dash-install://repo_name=Cheat Sheets&entry_name=MIME Types"
open "dash-install://repo_name=Cheat Sheets&entry_name=PHPUnit in Laravel"
open "dash-install://repo_name=Cheat Sheets&entry_name=You Might Not Need jQuery"
open "dash-install://repo_name=Stack Overflow&entry_name=JavaScript (Offline)"
open "dash-install://repo_name=Stack Overflow&entry_name=JavaScript (Offline)"
open "dash-install://repo_name=User Contributed&entry_name=Google Maps"
# cheatsheets are not supported yet
# open "dash-install://repo_name=Main Docsets&entry_name=Apache HTTP Server"
# open "dash-install://repo_name=Main Docsets&entry_name=MongoDB"
# open "dash-install://repo_name=Main Docsets&entry_name=Mongoose"
# open "dash-install://repo_name=Main Docsets&entry_name=Bash"
# open "dash-install://repo_name=Main Docsets&entry_name=AppleScript"
# open "dash-install://repo_name=Main Docsets&entry_name=Chai"
# open "dash-install://repo_name=Main Docsets&entry_name=Mocha"
# open "dash-install://repo_name=Main Docsets&entry_name=Cordova"
# open "dash-install://repo_name=Main Docsets&entry_name=Craft"
# open "dash-install://repo_name=Main Docsets&entry_name=HTML"
# open "dash-install://repo_name=Main Docsets&entry_name=CSS"
# open "dash-install://repo_name=Main Docsets&entry_name=D3JS"
# open "dash-install://repo_name=Main Docsets&entry_name=Docker"
# open "dash-install://repo_name=Main Docsets&entry_name=JavaScript"
# open "dash-install://repo_name=Main Docsets&entry_name=ElasticSearch"
# open "dash-install://repo_name=Main Docsets&entry_name=Express"
# open "dash-install://repo_name=Main Docsets&entry_name=Gulp"
# open "dash-install://repo_name=Main Docsets&entry_name=Jekyll"
# open "dash-install://repo_name=Main Docsets&entry_name=jQuery"
# open "dash-install://repo_name=Main Docsets&entry_name=Laravel"
# open "dash-install://repo_name=Main Docsets&entry_name=Markdown"
# open "dash-install://repo_name=Main Docsets&entry_name=MomentJS"
# open "dash-install://repo_name=Main Docsets&entry_name=MySQL"
# open "dash-install://repo_name=Main Docsets&entry_name=NodeJS"
# open "dash-install://repo_name=Main Docsets&entry_name=PHP"
# open "dash-install://repo_name=Main Docsets&entry_name=PHPUnit"
# open "dash-install://repo_name=Main Docsets&entry_name=Sass"
# open "dash-install://repo_name=Main Docsets&entry_name=SVG"
# open "dash-install://repo_name=Main Docsets&entry_name=Twig"
# open "dash-install://repo_name=Main Docsets&entry_name=VueJS"

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
brew tap caskroom/fonts
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
