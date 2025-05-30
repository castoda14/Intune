#!/bin/zsh
#set -x

############################################################################################
##
## Script to Uninstall Microsoft Defender
##
############################################################################################

## Copyright (c) 2020 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com

# User Defined variables
logandmetadir="/Library/Application Support/Microsoft/IntuneScripts/installDefender"      # The location of our logs and last updated data
appname="Defender"

# Generated variables
log="$logandmetadir/$appname.log"                                                         # The location of the script log file

# Create Log Directory if we need to...
if [[ ! -d "$logandmetadir" ]]; then
    ## Creating Metadirectory
    echo "$(date) | Creating [$logandmetadir] to store logs"
    mkdir -p "$logandmetadir"
fi

# Start Logging
exec > >(tee -a "$log") 2>&1

echo ""
echo "###############################################################################"
echo "# $(date) | Logging uninstall of Microsoft Defender for Endpoint to [$log]"
echo "############################################################################"
echo ""

# Start Uninstalling
sudo '/Library/Application Support/Microsoft/Defender/uninstall/uninstall'