# write-host does not work for tee-object

Write-Host "write-host" | Tee-Object -FilePath "$PSScriptRoot\..\output\log 06-1.txt"
Write-Output "write-output" | Tee-Object -FilePath "$PSScriptRoot\..\output\log 06-2.txt"
