. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

$sum = @{Total = 0}
$notAccessibleVar = "hello outside"

1..5 | Invoke-Parallel -Quiet -Throttle 3 -ScriptBlock { 
    Write-Host "adding $_"
    ($using:sum).Total = ($using:sum).Total + $_
    Write-Host $notAccessibleVar
}

Write-Host "total: $($sum.Total)"
