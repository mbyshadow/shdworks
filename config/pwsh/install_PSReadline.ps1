#Requires -RunAsAdministrator

Clear-Host

if ($psISE)
{
	exit
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Installing the latest PSReadLine
# https://github.com/PowerShell/PSReadLine/releases
# https://www.powershellgallery.com/packages/PSReadLine
$Parameters = @{
	Uri            = "https://api.github.com/repos/PowerShell/PSReadLine/releases"
	UseBasicParsing = $true
}
$LatestPSReadLineVersion = (Invoke-RestMethod @Parameters | Where-Object -FilterScript {$_.prerelease -eq $true}).tag_name.Replace("v", "") | Select-Object -First 1
# Remove "-beta" in the release version

if ($null -eq (Get-Module -Name PSReadline -ListAvailable -ErrorAction Ignore))
{
	Write-Verbose -Message "PSReadline module doesn't exist" -Verbose
	Write-Verbose -Message "Installing PSReadline" -Verbose

	Install-Module -Name PSReadline -AllowPrerelease -Force
	Remove-Module -Name PowerShellGet -Force

	Write-Verbose -Message "PSReadline installed. Restart the PowerShell session, and re-run the script" -Verbose

	exit
}
else
{
	$CurrentPSReadlineVersion = (Get-Module -Name PSReadline).Version.ToString()
}

# Installing the latest PSReadLine
if ([System.Version]$CurrentPSReadlineVersion -lt [System.Version]$LatestPSReadLineVersion)
{
	Write-Verbose -Message "Installing PSReadLine $($LatestPSReadLineVersion)" -Verbose

	Install-Module -Name PSReadline -AllowPrerelease -Force

	Write-Verbose -Message "PSReadLine installed. Restart the PowerShell session and re-run the script" -Verbose

	exit
}

if ([System.Version]$CurrentPSReadlineVersion -eq [System.Version]$LatestPSReadLineVersion)
{
	# Removing all PSReadLine folders except the latest and the default ones
	Get-Childitem -Path "$env:ProgramFiles\WindowsPowerShell\Modules\PSReadLine" -Force | Where-Object -FilterScript {$_.Name -ne $LatestPSReadLineVersion} | Remove-Item -Recurse -Force
}