$cmd, $logFile, $my_args = $args
if ($args.Count -lt 4) {
    & "$cmd" $my_args *>&1 | Tee-Object -FilePath "$logFile" -Append
} else {
    & "$cmd" @my_args *>&1 | Tee-Object -FilePath "$logFile" -Append
}
exit $lastexitcode