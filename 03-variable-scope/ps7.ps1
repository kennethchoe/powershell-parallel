$sum = @{Total = 0}
$notAccessibleVar = "hello outside"

1..5 | Foreach-Object -Parallel { 
    Write-Host "adding $_"
    ($using:sum).Total = ($using:sum).Total + $_
    Write-Host $notAccessibleVar
} -ThrottleLimit 3 

Write-Host "total: $($sum.Total)"
