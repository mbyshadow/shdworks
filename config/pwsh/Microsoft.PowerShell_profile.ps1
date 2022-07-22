#Import-Module PoshColor
  Import-Module DockerCompletion
  Import-Module posh-git
  Import-WslCommand "awk", "emacs", "fgrep", "egrep", "head", "less", "sed", "seq", "ssh", "tail", "man"#, "ls", "vim"

  $WslDefaultParameterValues = @{}
  $WslDefaultParameterValues["grep"] = "-E --color=auto"
  $WslDefaultParameterValues["less"] = "-i"
  $WslDefaultParameterValues["ls"] = "--color=auto --human-readable --group-directories-first"

  Import-Module oh-my-posh
  oh-my-posh --init --shell pwsh --config "~/Documents/PowerShell/shposh-theme.omp.json" | Invoke-Expression
#Import-Module cd-extras

# Chocolatey profile
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
#}

#Import-Module posh-git 
