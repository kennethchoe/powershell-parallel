Import-Module "$PSScriptRoot\..\modules\process-communication.psm1" -DisableNameChecking

$obj = @{
    "propA" = "A";
    "propB" = 100;
    "propC" = @{
        "propC1" = "C1";
    }
}

$consoleResult = RunOn-Console "$PSScriptRoot\child.ps1" "$PSScriptRoot\..\output\07-log.txt" @{
    "obj" = $obj;
}

"from obj:"
$obj | Out-String | Out-Host
$obj.PropC | Out-String | Out-Host

"from consoleResult.obj:"
$consoleResult.obj | Out-String | Out-Host
$consoleResult.obj.PropC | Out-String | Out-Host