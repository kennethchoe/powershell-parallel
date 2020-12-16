param ($params)

$output = $params | Out-String
Write-Host "params from the child:`n$output"

# child can change values
$params.obj.PropB += 10
$params.obj.PropC.PropC1 = "message from child"

# try debugging
#Wait-Debugger