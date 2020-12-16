1..5 | Foreach-Object -Parallel { 
    Write-Host "Starting: $_"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 5000)
    Write-Host "Finishing: $_"
} -Throttle 3 