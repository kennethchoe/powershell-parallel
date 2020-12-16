. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

$sum = @{Total = 0}

1..5 | Invoke-Parallel -Throttle 3 -ScriptBlock { 
    function Enter-Singleton($key) {
        $mtx = New-Object System.Threading.Mutex($false, $key)
	    if (-not $mtx.WaitOne(10000)) {
		    throw "Timeout acquiring Mutex!"
            exit 1
        }
        return $mtx
    }

    function Exit-Singleton($mtx) {
        [void]$mtx.ReleaseMutex()
        $mtx.Dispose()
    }

    function Assign($obj, $num) {
        $obj.Total = $num
    }

    Write-Host "$_ : started"

    # exclusiveness is controlled by the key. try these 2 options.
    $mtx = Enter-Singleton "singleton-test"
    #$mtx = Enter-Singleton "singleton-test $_"

    $copy = ($using:sum).Total
    Write-Host "$_ : $copy"
    $copy += $_
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    Write-Host "$_ : $copy"
    Assign $using:sum $copy
    Exit-Singleton $mtx
    Write-Host "$_ : finished"
}

Write-Host "total: $($sum.Total)"
