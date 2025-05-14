##
## Compliance script used to calculate compliance against WSL distros based on Distro and Distro Version
##

# Output object used for remediation
$jsonOutput = @{}

# Class used to build compliance check values
class OSCompliance
{
    [ValidateNotNullOrEmpty()][string]$distro
    [ValidateNotNullOrEmpty()][string]$minVersion
    [ValidateNotNullOrEmpty()][string]$maxVersion

    OSCompliance($distro, $minVersion, $maxVersion)
    {
        $this.distro = $distro
        $this.minVersion = $minVersion
        $this.maxVersion = $maxVersion
    }
}

# Configure desired compliance values (EDIT THESE VALUES TO THE DESIRED DISTROS, VERSIONS (Distro, Min Version, Max Version) AND STALE DATA TIME OUT)
$compliantDistroValues = [System.Collections.ArrayList]@()
[void]$compliantDistroValues.Add([OSCompliance]::new("Ubuntu", "20.04", "22.04"))

# Require last check in time to be within a certain number of days e.g.60 days
$compliantLastCheckInTimeout = 60

$isCompliant = $true
try {
    # Pull list of user ids from registry
    $userIds = Get-ChildItem -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Intune\WSLManagement' | Select-Object Name

    # Put together a list of all the distros across users
    $distroIds = [System.Collections.ArrayList]@()
    foreach ($id in $userIds)
    {
        $id.Name = $id.Name.Replace('HKEY_LOCAL_MACHINE', 'HKLM:')
        $usersDistroIds = Get-ChildItem -Path $id.Name | Select-Object Name

        foreach($usersDistroId in $usersDistroIds)
        {
            [void]$distroIds.Add($usersDistroId.Name)
        }
    }

    # Create compliant last check in date
    $compliantDate = Get-Date 
    $compliantDate = $compliantDate.AddDays($compliantLastCheckInTimeout * -1).ToUniversalTime()

    # Check compliance of all distros 
    foreach($distroId in $distroIds) 
    {
        $name = $distroId.Replace('HKEY_LOCAL_MACHINE', 'HKLM:')
        $distro = Get-ItemPropertyValue -Path $name -Name Distro
        $distroVersion = Get-ItemPropertyValue -Path $name -Name Version
        $lastCheckin = Get-ItemPropertyValue -Path $name -Name LastCheckinTime

        # Convert and check last check in time
        $lastCheckin = Get-Date -Date $lastCheckin
        if ($lastCheckin -lt $compliantDate)
        {
            $isCompliant = $false
            break
        }

        # Check that disto and version meet compliance requirements
        $compliantDistro = $compliantDistroValues.where({$_.distro.ToLower() -eq $distro.ToLower()})
        if ($compliantDistro -ne $null)
        {
            $min = $compliantDistro.minVersion
            $max = $compliantDistro.maxVersion
            if ($distroVersion -lt $min -or $distroVersion -gt $max)
            {
                $isCompliant = $false
                break
            }
        }
        else
        {
            $isCompliant = $false
            break
        }
    }
}
catch {
    # Default to compliant if there are any issues reading registry keys
    $jsonOutput += @{ WSLInstancesComplianceStatus = "Compliant" }
    return $jsonOutput | ConvertTo-Json -Compress
}

if ($isCompliant)
{
    $jsonOutput += @{ WSLInstancesComplianceStatus = "Compliant" }
}
else
{
    $jsonOutput += @{ WSLInstancesComplianceStatus = "Not Compliant" }
}

return $jsonOutput | ConvertTo-Json -Compress
