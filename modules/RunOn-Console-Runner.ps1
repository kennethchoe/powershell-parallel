param (
[string] $scriptPath,
[string] $paramFilePath)

Import-Module "$PSScriptRoot\process-communication-utils.psm1" -DisableNameChecking

$params = DeserializeFrom-File $paramFilePath

. "$scriptPath" $params

ReturnFrom-Console $params $paramFilePath