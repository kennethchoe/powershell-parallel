# this is the same as 02-parallel-basic ps5.ps1, except that it uses Write-Output instead of Write-Host.
# why is it no longer run them in parallel? not sure.

. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    Write-Output "$_ --"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 5000)
    Write-Output "  --> $_"
}