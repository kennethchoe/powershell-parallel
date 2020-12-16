Import-Module "$PSScriptRoot\process-communication-utils.psm1" -DisableNameChecking

function RunOn-Console($psFile, $logFile, $params) {
    $paramFilePath = (New-TemporaryFile).FullName;
    SerializeTo-File $params $paramFilePath | Out-Null

    $result = start-process "powershell.exe" -ArgumentList @(". '$PSScriptRoot\run-with-tee.ps1'", "'$PSScriptRoot\RunOn-Console-Runner.ps1'", "'$logFile'", "'$psFile'", "'$paramFilePath'") -PassThru -Wait

    if ($result.exitcode) {
        throw "Check $logFile";
    }
    $returnValue = DeserializeFrom-File "$paramFilePath-return"
    return $returnValue
}
