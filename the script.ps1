$id = $args[0]
if (-not $id) {
    $id = "0"
}

$step = 1
while ($step -lt 5) {
    Write-Host "$(Get-Date -Format HH:mm:ss.fff) tenant $id step $step"
    Start-Sleep -Milliseconds (Get-Random -Minimum 10 -Maximum 3000)
    $step += 1
}
