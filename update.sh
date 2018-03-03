#!/usr/bin/env bash
set -e

###############################################################################
# Updates brew, gem, pip, npm and git repos
###############################################################################

# check what could be updated
echo 'Outdated brew packages:'
brew outdated
echo 'Outdated gem packages:'
gem outdated
echo 'Outdated pip packages:'
pip list --outdated --format=legacy
echo 'Outdated npm packages:'
npm-check -g

read -p "Do you want to update the packages? (y)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # update brew, its formulas, the installed packages and perform a cleanup
    brew update && brew upgrade && brew cleanup
    # update gem and gems
    gem update --system && gem update
    # update pip packages
    pip install $(pip list --outdated --format=legacy | awk '{ print $1 }') --upgrade
    # update npm packages (interactively)
    npm-check -gu
    # update git repos
    cd "$BASH_STUFF/mac-setup"
    git pull

    echo 'All packages have been updated.'
    tput bel
fi

# Notes:

# list brew packages
# brew list

# prevent upgrading of a certain package
# brew pin mysql

# list gems
# gem list

# list pip packages
# pip list
