#!/usr/bin/env bash
set -e

###############################################################################
# Configure MacOS
###############################################################################

echo 'Start configuring Mac'

# close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for the root password upfront
sudo -v
# keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# create Web directory for storing projects
cd ~
mkdir Web

# remove folders not needed
sudo rm -rf ~/Music
sudo rm -rf ~/Movies
sudo rm -rf ~/Documents
sudo rm -rf ~/Pictures
sudo rm -rf ~/Public

# prevent directories from being backuped
sudo tmutil addexclusion -p ~/Downloads
sudo tmutil addexclusion -p ~/Desktop
sudo tmutil addexclusion -p ~/Library/Caches

# show hidden folders
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

# disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# set the timezone
sudo systemsetup -settimezone "Europe/Zurich" > /dev/null

# expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
# expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true
# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# disable automatic capitalization as it’s annoying when typing code
defaults write -g NSAutomaticCapitalizationEnabled -bool false
# disable smart dashes as they’re annoying when typing code
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
# disable automatic period substitution as it’s annoying when typing code
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
# disable smart quotes as they’re annoying when typing code
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
# disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# disable "natural" (Lion-style) scrolling
defaults write -g com.apple.swipescrolldirection -bool false
# enable full keyboard access for all controls
defaults write -g AppleKeyboardUIMode -int 3
# use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
# set a blazingly fast keyboard repeat rate
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# use dark ui
defaults write -g AppleInterfaceStyle 'Dark'

# disable guest access
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

# change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
# enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true
# don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# wipe default dock icons
defaults write com.apple.dock persistent-apps -array

# disable animations for showing and hiding sheets, resizing preference windows, zooming windows
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
# disable animations when opening and closing windows
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
# disable animation on spring delay
defaults write -g com.apple.springing.delay -float 0
# disable animation when showing a toolbar or menu bar in full screen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
# disable animations when opening a Quick Look window
defaults write -g QLPanelAnimationDuration -float 0
# diable animations when scrolling column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
# disable animations for Mission Control
defaults write com.apple.dock expose-animation-duration -float 0
# disable animations when showing and hiding Launchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
# disable animations when changing pages in Launchpad
defaults write com.apple.dock springboard-page-duration -float 0
# disable animations when opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
# disable the delay when you hide the Dock
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
# disable animations of info windows
defaults write com.apple.finder DisableAllAnimations -bool true

# enable text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
# don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true
# disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
# hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false
# enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
# update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# disable the annoying line marks in Terminal
defaults write com.apple.Terminal ShowLineMarks -int 0
# prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true
# prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# show file extensions
defaults write -g AppleShowAllExtensions -bool true
# display full posix path in Finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# change default view style to column view
defaults write com.apple.Finder FXPreferredViewStyle "Nlsv"
# set path bar root to home directory
defaults write com.apple.finder PathBarRootAtHome -bool TRUE
# disable extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true
# set previously created Web directory as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Web/"
# show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# enable path bar
defaults write com.apple.finder ShowPathbar -bool true
# keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo 'Finished configuring Mac'
tput bel
