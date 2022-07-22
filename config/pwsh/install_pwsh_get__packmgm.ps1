#Requires -RunAsAdministrator

Clear-Host

if ($psISE)
{
	exit
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


# Installing the latest PowerShellGet & PackageManagement
# https://www.powershellgallery.com/packages/PowerShellGet
# https://github.com/PowerShell/PowerShellGet
# https://www.powershellgallery.com/packages/PackageManagement

$DownloadsFolder = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}"
$Parameters = @{
	Uri             = "https://raw.githubusercontent.com/PowerShell/PowerShellGet/master/src/PowerShellGet.psd1"
	OutFile         = "$DownloadsFolder\PowerShellGet.psd1"
	UseBasicParsing = $true
	Verbose         = $true
}
Invoke-WebRequest @Parameters

# Get the latest PowerShellGet version
$LatestPowerShellGetVersion = (Import-PowerShellDataFile -Path "$DownloadsFolder\PowerShellGet.psd1").ModuleVersion
Remove-Item -Path "$DownloadsFolder\PowerShellGet.psd1" -Force

if ($null -eq (Get-Module -Name PowerShellGet -ErrorAction Ignore))
{
	try
	{
		Import-Module -Name PowerShellGet -Force -ErrorAction Stop
		$CurrentPowerShellGetVersion = (Get-Module -Name PowerShellGet | Select-Object -Index 0).Version.ToString()
	}
	catch
	{
		Write-Verbose -Message "PowerShellGet module doesn't exist" -Verbose
		Write-Verbose -Message "Installing PowerShellGet 2.2.5 & PackageManagement 1.4.7" -Verbose

		Install-Module -Name PowerShellGet -Force
		Remove-Module -Name PowerShellGet -Force

		# Removing all PowerShellGet folders except the latest and the default ones
		Get-Childitem -Path "$env:ProgramFiles\WindowsPowerShell\Modules\PowerShellGet" -Force | Where-Object -FilterScript {$_.Name -ne "2.2.5"} | Remove-Item -Recurse -Force

		Import-Module -Name PowerShellGet -RequiredVersion 2.2.5 -Force
		Import-Module -Name PackageManagement -RequiredVersion 1.4.7 -Force

		Write-Verbose -Message "PowerShellGet 2.2.5 & PackageManagement 1.4.7 installed. Restart the PowerShell session, and re-run the script" -Verbose

		exit
	}
}
else
{
	$CurrentPowerShellGetVersion = (Get-Module -Name PowerShellGet | Select-Object -Index 0).Version.ToString()
}

if ([System.Version]$CurrentPowerShellGetVersion -lt [System.Version]"2.2.5")
{
		Write-Verbose -Message "Installing PowerShellGet & PackageManagement" -Verbose

		Install-Module -Name PowerShellGet -Force
		Remove-Module -Name PowerShellGet -Force

		# Removing all PowerShellGet folders except the latest and the default ones
		Get-Childitem -Path "$env:ProgramFiles\WindowsPowerShell\Modules\PowerShellGet" -Force | Where-Object -FilterScript {$_.Name -ne "2.2.5"} | Remove-Item -Recurse -Force

		Import-Module -Name PowerShellGet -RequiredVersion 2.2.5 -Force
		Import-Module -Name PackageManagement -RequiredVersion 1.4.7 -Force

		Write-Verbose -Message "PowerShellGet 2.2.5 & PackageManagement 1.4.7 installed. Restart the PowerShell session, and re-run the script" -Verbose

		exit
}

if ([System.Version]$CurrentPowerShellGetVersion -lt [System.Version]$LatestPowerShellGetVersion)
{
		Write-Verbose -Message "Installing PowerShellGet $($LatestPowerShellGetVersion)" -Verbose

		# We cannot install the preview build immediately due to the default 1.0.0.1 build doesn't support -AllowPrerelease
		Install-Module -Name PowerShellGet -AllowPrerelease -Force

		Write-Verbose -Message "PowerShellGet $($LatestPowerShellGetVersion) installed. Restart the PowerShell session, and re-run the script" -Verbose

		exit
}