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
brew cask install imageoptim
brew cask install slack
brew cask install discord
brew cask install etcher
brew cask install spectacle
brew cask install spotify
brew cask install free-ruler
brew cask install the-unarchiver
brew cask install wkhtmltopdf
brew cask install virtualbox
brew cask install wireshark
brew cask install disk-inventory-x
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

# install dash with cheatsheets stack overflow and user contributes stuff
brew cask install dash
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
brew cask install font-dosis
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
