#!/bin/zsh
#set -x
############################################################################################
##
## Script to disable Bonjour Advertising Services
##
############################################################################################

## Copyright (c) 2025 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com

# Define variables
appname="DisableBonjourAdvertisingServices"                                                     # The name of our script
logandmetadir="/Library/Logs/Microsoft/IntuneScripts/$appname"                                  # The location of our logs and last updated data
log="$logandmetadir/$appname.log"                                                               # The location of the script log file

# Check if the log directory has been created
if [ -d $logandmetadir ]; then
    # Already created
    echo "$(date) | Log directory already exists - $logandmetadir"
else
    # Creating Metadirectory
    echo "$(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi

# Disable Bonjour Advertising Services
DisableBonjourAdvertisingServices() {
/usr/bin/defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true
echo "$(date) | Bonjour Advertising Services is now disabled or already disabled. Closing script..."
}

# Start logging
exec &> >(tee -a "$log")

# Begin Script Body
echo ""
echo "##############################################################"
echo "# $(date) | Starting running of script $appname"
echo "############################################################"
echo ""

# Run function
DisableBonjourAdvertisingServices