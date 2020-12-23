# this is what we ran on ps5-invoke-script.ps1:
# . "$PSScriptRoot\..\the script.ps1" "CCC" *>&1 | Tee-Object -FilePath "<logfile>.txt"

# this does the same thing, but uses sharable code run-with-tee.ps1. "CCC" and the rest are parameters to "the script.ps1"
. "$PSScriptRoot\..\modules\run-with-tee.ps1" "$PSScriptRoot\..\the script.ps1" "$PSScriptRoot\..\output\log 06-run-with-tee.txt" "CCC"
