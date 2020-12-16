# what if your existing PS code uses write-host?
. "$PSScriptRoot\..\the script.ps1" "A" | Tee-Object -FilePath "$PSScriptRoot\..\output\log 06-invoke-script-1.txt"

"*>&1 makes it work!"
. "$PSScriptRoot\..\the script.ps1" "B" *>&1 | Tee-Object -FilePath "$PSScriptRoot\..\output\log 06-invoke-script-2.txt"
