Let's say your installation script is `the script.ps1`.

When multiple executions write their result all in one console output, the result is not comprehensible (ps5-confusing).

We decided to launch a separate console for each execution using `Start-Process`, but then now this becomes multi-processing problem, not multi-threading problem! We need to revisit how to pass variables and return variables.