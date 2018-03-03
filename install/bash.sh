#!/usr/bin/env bash
set -e

###############################################################################
# Install/configure bash
###############################################################################

echo 'Start bash installation'

echo source "\$BASH_STUFF/mac-setup/bash.sh" >> ~/.bash_profile
source ~/.bash_profile

echo 'Finished installing bash'
tput bel
