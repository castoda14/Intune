# Illumio VEN Installation & Illumio VEN Registration Installer

This script is an example to show how to use [Intune Shell Scripting](https://docs.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts) to install applications. In this case the script will download the Illumio VEN pkg file from your download server e.g. Azure Blob Storage Container and then install application onto the Mac. Also, in order to apply Illumio VEN Registration to devices that already have Illumio VEN installed, we are also providing separate script for that.

## Things you'll need to do (installIllumioVEN.sh)

- From line 36, change correct server address URL where PKG-installer will be downloaded e.g. your Azure Blob Storage Container.
- From line 43, if you want to install Illumio VEN to devices that are not superviced e.g. BYOD-devices, change value to "false" without quotes.

## Things you'll need to do (illumioVENRegistrationInstaller.sh)

- From line 34, if you want to install Illumio VEN to devices that are not superviced e.g. BYOD-devices, change value to "false" without quotes.
- From line 35, set Illumio VEN activation code from your pairing script
- From line 36, set Illumio VEN management server address from your pairing script without https:// -prefix.
- From line 37, set Illumio VEN profile id from your pairing script.

## Script Settings (installIllumioVEN.sh)

- Run script as signed-in user : No
- Hide script notifications on devices : Yes
- Script frequency : Not configured
- Number of times to retry if script fails : 3

## Script Settings (illumioVENRegistrationInstaller.sh)

- Run script as signed-in user : No
- Hide script notifications on devices : Yes
- Script frequency : Every 15 minutes
- Number of times to retry if script fails : 3

## Log File (installIllumioVEN.sh)

The log file will output to ***/Library/Logs/Microsoft/IntuneScripts/IllumioVEN.log*** by default. Exit status is either 0 or 1. To gather this log with Intune remotely take a look at  [Troubleshoot macOS shell script policies using log collection](https://docs.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#troubleshoot-macos-shell-script-policies-using-log-collection)

```
#############################################################
# Fri Nov 17 21:25:34 EET 2023 | Logging install of [IllumioVEN] to [/Library/Logs/Microsoft/IntuneScripts/IllumioVEN/IllumioVEN.log]
############################################################

Fri Nov 17 21:25:34 EET 2023 | Checking MDM Profile Type
Enrolled via DEP: Yes
Fri Nov 17 21:25:34 EET 2023 | Device is ABM Managed
Fri Nov 17 21:25:34 EET 2023 | Checking if we need Rosetta 2 or not
Fri Nov 17 21:25:34 EET 2023 | Waiting for other [/usr/sbin/softwareupdate] processes to end
Fri Nov 17 21:25:34 EET 2023 | No instances of [/usr/sbin/softwareupdate] found, safe to proceed
Fri Nov 17 21:25:34 EET 2023 | Rosetta is already installed and running. Nothing to do.
Fri Nov 17 21:25:34 EET 2023 | Checking if we need to install or update [IllumioVEN]
Fri Nov 17 21:25:34 EET 2023 | [IllumioVEN] not installed, need to download and install
Fri Nov 17 21:25:34 EET 2023 | Dock is here, lets carry on
Fri Nov 17 21:25:34 EET 2023 | Starting downlading of [IllumioVEN]
Fri Nov 17 21:25:34 EET 2023 | Waiting for other [curl -f] processes to end
Fri Nov 17 21:25:34 EET 2023 | No instances of [curl -f] found, safe to proceed
Fri Nov 17 21:25:34 EET 2023 | Downloading IllumioVEN
Fri Nov 17 21:25:38 EET 2023 | Found downloaded tempfile [IllumioVEN.pkg]
Fri Nov 17 21:25:38 EET 2023 | Downloaded [illumio-ven-ctl] to [IllumioVEN.pkg]
Fri Nov 17 21:25:38 EET 2023 | Detected install type as [PKG]
Fri Nov 17 21:25:38 EET 2023 | Waiting for other [/opt/illumio_ven/illumio-ven-ctl] processes to end
Fri Nov 17 21:25:38 EET 2023 | No instances of [/opt/illumio_ven/illumio-ven-ctl] found, safe to proceed
Fri Nov 17 21:25:38 EET 2023 | Installing IllumioVEN
installer: Package name is 
installer: Installing at base path /
installer: The install was successful.
Fri Nov 17 21:25:41 EET 2023 | IllumioVEN Installed
Fri Nov 17 21:25:41 EET 2023 | Cleaning Up
Fri Nov 17 21:25:41 EET 2023 | Application [IllumioVEN] succesfully installed
Fri Nov 17 21:25:41 EET 2023 | Writing last modifieddate [Tue, 17 Oct 2023 11:31:35 GMT] to [/Library/Logs/Microsoft/IntuneScripts/IllumioVEN/IllumioVEN.meta]
```
## Log File (illumioVENRegistrationInstaller.sh)

The log file will output to ***/Library/Logs/Microsoft/IntuneScripts/IllumioVENRegistrationInstaller.log*** by default. Exit status is either 0 or 1. To gather this log with Intune remotely take a look at  [Troubleshoot macOS shell script policies using log collection](https://docs.microsoft.com/en-us/mem/intune/apps/macos-shell-scripts#troubleshoot-macos-shell-script-policies-using-log-collection)

```
##############################################################
# Fri Nov 17 20:58:00 EET 2023 | Logging install of [IllumioVENRegistrationInstaller] to [/Library/Logs/Microsoft/IntuneScripts/IllumioVENRegistrationInstaller/IllumioVENRegistrationInstaller.log]
############################################################

Fri Nov 17 20:58:00 EET 2023 | Checking MDM Profile Type
Fri Nov 17 20:58:00 EET 2023 | Device is ABM Managed
Fri Nov 17 20:58:00 EET 2023 | Illumio VEN is installed. Let's continue...
Fri Nov 17 20:58:00 EET 2023 | Illumio VEN Registration is not applied. Let's apply registration...
Fri Nov 17 20:58:00 EET 2023 | Applying Illumio VEN Registration...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0100 45275    0 45275    0     0   121k      0 --:--:-- --:--:-- --:--:--  124k
Checking Runtime Environment..........

             Activating Illumio
             ------------------
Detected PCE fqdn/port change .....
Storing Activation Configuration .....
Starting Illumio Processes............

               Pairing Status
               --------------
Pairing Configuration exists ......SUCCESS 
VEN Manager Daemon running ........SUCCESS 
Master Configuration retrieval ....SUCCESS 
VEN Configuration retrieval .......PENDING
VEN Configuration retrieval .......SUCCESS 

VEN has been SUCCESSFULLY paired with Illumio

Fri Nov 17 20:58:13 EET 2023 | Illumio VEN Registration applied. Creating Registration detection file...
Fri Nov 17 20:58:13 EET 2023 | Done. Closing script...
```