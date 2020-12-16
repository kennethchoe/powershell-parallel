. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"
$psRoot = $PSScriptRoot

$sum = @{Total = 0}

1..5 | Foreach-Object -Parallel {
    Import-Module "$($using:psRoot)\..\modules\mutex.psm1"

    function Assign($obj, $num) {
        $obj.Total = $num
    }

    Write-Host "$_ : started"
    $mtx = Enter-Singleton "singleton-test"
    $copy = ($using:sum).Total
    Write-Host "$_ : $copy"
    $copy += $_
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    Write-Host "$_ : $copy"
    Assign $using:sum $copy
    Exit-Singleton $mtx
    Write-Host "$_ : finished"
} -ThrottleLimit 3

Write-Host "total: $($sum.Total)"
