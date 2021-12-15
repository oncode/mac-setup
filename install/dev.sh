#!/usr/bin/env bash
set -e

###############################################################################
# Install development tools
###############################################################################

echo 'Start installing dev tools'

# xcode
xcode-select --install
sudo xcodebuild -license accept

# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bash_profile

# git
brew install git
brew unlink git && brew link git
git config --global user.name 'Manuel Sommerhalder'
git config --global user.email 'hello@oncode.ch'
git config --global core.editor nano
git config --global pull.rebase true

brew install yarn --without-node # without node so the n version is used
brew install composer
brew install graphicsmagick
brew install imagemagick
brew install redis
brew install mongodb
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
brew install ffmpeg --with-chromaprint --with-fdk-aac --with-libass --with-librsvg --with-libsoxr --with-libssh --with-tesseract --with-libvidstab --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-rtmpdump --with-rubberband --with-sdl2 --with-snappy --with-tools --with-webp --with-x265 --with-xz --with-zeromq --with-zimg

# mysql
brew install mysql
brew services start mysql
mysql_secure_installation
brew services stop mysql

# ruby and ruby gems
brew install ruby
gem install -n /usr/local/bin sass
gem install -n /usr/local/bin sass-json-vars
gem install -n /usr/local/bin compass
gem install -n /usr/local/bin scss_lint

# phyton and pip packages
brew install python
brew unlink python && brew link python
pip install ImageScraper

# global npm packages
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
