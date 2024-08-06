$env:USERPROFILE = "C:\Users\doduy"
$env:PS_HOME = "$env:USERPROFILE\Documents\PowerShell"
$env:PS_CONFIG = "$PROFILE.CurrentUserCurrentHost"

# VIM
$env:VIM_HOME = "$env:USERPROFILE\AppData\Local\nvim"
$env:VIMRC = "$env:VIM_HOME\init.lua"

# WORK
$env:FLM = "D:\dev-one"
$env:TO_BFF = "$env:FLM\om-flm-bff"
$env:TO_VSL = "$env:FLM\om-flm-vessel-management-service"
$env:TO_USR = "$env:FLM\om-flm-setting-service"
$env:TO_PROTO = "$env:FLM\om-protobuf"
$env:PERSONAL_WS = "D:\dev-personal"

# Host
$env:TO_HOST = "C:\Windows\System32\drivers\etc"

# SSH
$env:TO_SSH = "$env:USERPROFILE\.ssh"