# this is what we ran on ps5-run-with-tee.ps1:
#. "$PSScriptRoot\..\modules\run-with-tee.ps1" "$PSScriptRoot\..\the script.ps1" "<logfile>.txt" "DDD"

# run the same thing with Start-Process
Start-Process "powershell.exe" -ArgumentList @(
    ".", 
    # if your full path ($PSScriptRoot) contains space, wrapping with ' is important.
    "'$PSScriptRoot\..\modules\run-with-tee.ps1'", 
    "'$PSScriptRoot\..\the script.ps1'", 
    "'$PSScriptRoot\..\output\log 06-start-process-one.txt'", 
    "DDD") -Wait
