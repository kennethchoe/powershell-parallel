$psRoot = $PSScriptRoot

$sum = @{Total = 0}

1..5 | Foreach-Object -Parallel {

    Import-Module "$($using:psRoot)\..\modules\mutex.psm1" -Force

    $mtx = Enter-Singleton "singleton-test"

    Write-Host "($(($using:sum).Total)) $_ --"
    $copy = ($using:sum).Total
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    ($using:sum).Total = $copy + $_
    Write-Host "($(($using:sum).Total))   --> $_"

    Exit-Singleton $mtx

} -ThrottleLimit 3

Write-Host "total: $($sum.Total)"
