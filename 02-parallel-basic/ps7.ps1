1..5 | Foreach-Object -Parallel { 
    Write-Host "$_ --"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 5000)
    Write-Host "  --> $_"
} -ThrottleLimit 3 