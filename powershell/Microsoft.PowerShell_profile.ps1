oh-my-posh init pwsh --config 'C:\Users\doduy\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json' | Invoke-Expression

$PROFILE_VARIABLE_PATH = "C:\Users\doduy\Documents\PowerShell\profiles\user_profile_variables.ps1"
$PROFILE_ALIASES_PATH = "C:\Users\doduy\Documents\PowerShell\profiles\user_profile_aliases.ps1"

if (Test-Path $PROFILE_VARIABLE_PATH) {
    . $PROFILE_VARIABLE_PATH
}

if (Test-Path $PROFILE_ALIASES_PATH) {
    . $PROFILE_ALIASES_PATH
}