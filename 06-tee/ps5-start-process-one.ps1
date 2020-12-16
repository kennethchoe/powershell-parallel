#. "$PSScriptRoot\..\modules\run-with-tee.ps1" "$PSScriptRoot\..\the script.ps1" "<logfile>.txt" "DDD"

Start-Process "powershell.exe" -ArgumentList @(
    ".", 
    # wrapping with ' is important to handle space in $PSScriptRoot
    "'$PSScriptRoot\..\modules\run-with-tee.ps1'", 
    "'$PSScriptRoot\..\the script.ps1'", 
    "'$PSScriptRoot\..\output\log 06-start-process-one.txt'", 
    "DDD") -Wait
