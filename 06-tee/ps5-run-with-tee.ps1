# . "$PSScriptRoot\..\the-script.ps1" "CCC" *>&1 | Tee-Object -FilePath "<logfile>.txt"

. "$PSScriptRoot\..\modules\run-with-tee.ps1" "$PSScriptRoot\..\the-script.ps1" "$PSScriptRoot\..\output\log 06-run-with-tee.txt" "CCC"
