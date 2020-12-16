. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"
$psRoot = $PSScriptRoot

Write-Host "started"

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock {
    . "$($using:psRoot)\..\the script.ps1" $_
}

Write-Host "ended"
