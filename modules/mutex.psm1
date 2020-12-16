function Enter-Singleton($key) {
    $mtx = New-Object System.Threading.Mutex($false, $key)
    if (-not $mtx.WaitOne(10000)) {
        throw "Timeout acquiring Mutex!"
        exit 1
    }
    return $mtx
}

function Exit-Singleton($mtx) {
    [void]$mtx.ReleaseMutex()
    $mtx.Dispose()
}

