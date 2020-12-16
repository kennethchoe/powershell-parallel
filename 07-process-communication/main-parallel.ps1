. "$PSScriptRoot\..\Invoke-Parallel\Invoke-Parallel.ps1"

$psRoot = $PSScriptRoot
1..2 | Invoke-Parallel -Quiet -ScriptBlock { 
    Import-Module "$($using:psRoot)\..\modules\process-communication.psm1" -DisableNameChecking -Force

    $obj = @{
        "propA" = "A";
        "propB" = $_;
        "propC" = @{
            "propC1" = "C1";
        }
    }
    
    $consoleResult = RunOn-Console "$($using:psRoot)\child.ps1" "$($using:psRoot)\..\output\07-log-$_.txt" @{
        "obj" = $obj;
    }
    
    $consoleResult.obj | Out-String | Out-Host
}