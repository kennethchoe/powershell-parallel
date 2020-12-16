. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"
Import-Module "$PSScriptRoot\..\modules\mutex.psm1"

$sum = @{Total = 0}

1..5 | Invoke-Parallel -Throttle 3 -ImportModules -ScriptBlock { 
    $mtx = Enter-Singleton "singleton-test"

    Write-Host "($(($using:sum).Total)) $_ --"
    $copy = ($using:sum).Total
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    ($using:sum).Total = $copy + $_
    Write-Host "($(($using:sum).Total))   --> $_"

    Exit-Singleton $mtx
}

Write-Host "total: $($sum.Total)"
