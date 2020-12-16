function SerializeTo-File($data, $outputFile) {
    [System.Management.Automation.PSSerializer]::Serialize($data) | Set-Content $outputFile
}

function DeserializeFrom-File($outputFile) {
    $serialized = Get-Content $outputFile -Raw
    return [System.Management.Automation.PSSerializer]::Deserialize($serialized)
}

function ReturnFrom-Console($params, $paramFilePath) {
    SerializeTo-File $params "$paramFilePath-return"
}