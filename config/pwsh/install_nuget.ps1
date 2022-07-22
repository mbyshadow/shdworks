#Requires -RunAsAdministrator

Clear-Host

if ($psISE)
{
	exit
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Installing the latest NuGet
if (-not (Test-Path -Path "$env:ProgramFiles\PackageManagement\ProviderAssemblies\nuget\*\Microsoft.PackageManagement.NuGetProvider.dll"))
{
	Write-Verbose -Message "Installing NuGet" -Verbose

	Install-PackageProvider -Name NuGet -Force
}
if ($null -eq (Get-PackageProvider -ListAvailable | Where-Object -FilterScript {$_.Name -ceq "NuGet"} -ErrorAction Ignore))
{
	Write-Verbose -Message "Installing NuGet" -Verbose

	Install-PackageProvider -Name NuGet -Force
}