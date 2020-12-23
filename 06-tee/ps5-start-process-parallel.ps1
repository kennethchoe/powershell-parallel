# run ps5-start-process-one.ps1 in multi-processing
# $PSScriptRoot needs to be given with $using caluse

. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"
$psRoot = $PSScriptRoot

Write-Host "started"

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    Start-Process "powershell.exe" -ArgumentList @(
        ".", 
        "'$($using:psRoot)\..\modules\run-with-tee.ps1'", 
        "'$($using:psRoot)\..\the script.ps1'", 
        "'$($using:psRoot)\..\output\log 06-start-process-parallel-$_.txt'", 
        $_) -Wait
}

Write-Host "ended"
