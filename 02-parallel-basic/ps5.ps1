. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

1..5 | Invoke-Parallel -Throttle 3 -ScriptBlock { 
    Write-Host "Starting: $_"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 5000)
    Write-Host "Finishing: $_"
}