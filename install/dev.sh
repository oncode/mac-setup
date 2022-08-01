#!/usr/bin/env bash
set -e

###############################################################################
# Install development tools
###############################################################################

echo 'Start installing dev tools'

# switch to bash
chsh -s /bin/bash

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/oncode/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
source ~/.bash_profile

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# install different node versions
nvm install 16.15.0
nvm install 14.11.0
nvm install 6.2.1

# git
brew install git
brew unlink git && brew link git
git config --global user.name 'Manuel Sommerhalder'
git config --global user.email 'hello@oncode.ch'
git config --global core.editor nano

# brew install yarn --without-node # without node so the n version is used
brew install composer
brew install graphicsmagick
brew install imagemagick
brew install redis
brew install mas
brew install fd
brew install exa
brew install wget
brew install grip
brew install youtube-dl
brew install httpie
http --version # call command so that ~/.httpie gets generated
brew install emojify
brew install p7zip
brew install nmap
brew install mozjpeg
brew install ffmpeg
brew install tree

# mysql
brew install mysql
brew services start mysql
mysql_secure_installation
brew services stop mysql

# ruby and ruby gems
brew install ruby
sudo gem install -n /usr/local/bin sass
sudo gem install -n /usr/local/bin sass-json-vars
sudo gem install -n /usr/local/bin compass
sudo gem install -n /usr/local/bin scss_lint

# phyton and pip packages
brew install python
brew unlink python && brew link python
pip install ImageScraper

# global npm packages
npm install -g firebase-tools
npm install -g npm-check
npm install -g how2
npm install -g slap@latest
npm install -g yo
npm install -g source-map-explorer
npm install -g git-standup
npm install -g git-open
npm install -g gulp-cli
npm install -g argus-eyes
npm install -g pa11y
npm install -g csscomb
npm install -g grunt-cli
npm install -g percollate

cd ~/Downloads
wget https://github.com/torakiki/sejda/releases/download/v3.2.48/sejda-console-3.2.48-bin.zip
7z x sejda-console-3.2.48-bin.zip
sudo install -d -o $(whoami) -g admin /usr/local/Sejda
mv sejda-console-3.2.48 /usr/local/Sejda/sejda-console-3.2.48
ln -s /usr/local/Sejda/sejda-console-3.2.48/bin/sejda-console /usr/local/bin/sejda-console

echo 'Finished installing dev tools'
tput bel
