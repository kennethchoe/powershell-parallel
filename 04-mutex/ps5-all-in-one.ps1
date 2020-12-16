. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

$sum = @{Total = 0}
$mtx = New-Object System.Threading.Mutex($false, "my-mutex")

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    Write-Host "starting $_"
    $null = ($using:mtx).WaitOne()
    Write-Host "($(($using:sum).Total)) $_ --"
    $copy = ($using:sum).Total
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    ($using:sum).Total = $copy + $_
    Write-Host "($(($using:sum).Total))   --> $_"
    $null = [void]($using:mtx).ReleaseMutex()
}

$mtx.Dispose()

Write-Host "total: $($sum.Total)"
