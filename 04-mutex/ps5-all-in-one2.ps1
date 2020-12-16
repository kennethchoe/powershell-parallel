. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

$sum = @{Total = 0}

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    function Enter-Singleton($key) {
        $mtx = New-Object System.Threading.Mutex($false, $key)
        return $mtx
    }

    function Exit-Singleton($mtx) {
        [void]$mtx.ReleaseMutex()
        $mtx.Dispose()
    }

    # exclusiveness is controlled by the key. try these 2 options.
    $mtx = Enter-Singleton "singleton-test"
    #$mtx = Enter-Singleton "singleton-test $_"

    Write-Host "($(($using:sum).Total)) $_ --"
    $copy = ($using:sum).Total
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    ($using:sum).Total = $copy + $_
    Write-Host "($(($using:sum).Total))   --> $_"

    Exit-Singleton $mtx
}

Write-Host "total: $($sum.Total)"
