. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"
$psRoot = $PSScriptRoot

Write-Host "started"

1..5 | Invoke-Parallel -Throttle 3 -ScriptBlock { 
    Start-Process "powershell.exe" -ArgumentList @(
        ".", 
        "'$($using:psRoot)\..\modules\run-with-tee.ps1'", 
        "'$($using:psRoot)\..\the-script.ps1'", 
        "'$($using:psRoot)\..\output\log 06-start-process-parallel-$_.txt'", 
        $_) -Wait
}

Write-Host "ended"
