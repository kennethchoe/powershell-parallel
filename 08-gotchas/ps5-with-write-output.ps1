. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    Write-Output "$_ --"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 5000)
    Write-Output "  --> $_"
}