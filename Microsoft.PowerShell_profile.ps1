#Import-Module PoshColor

#Import-Module oh-my-posh
#oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH\ys.omp.json | Invoke-Expression

#Import-Module cd-extras

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#Import-Module posh-git 
