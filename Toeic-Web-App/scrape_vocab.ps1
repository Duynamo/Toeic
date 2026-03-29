$allData = @()

for ($i = 1; $i -le 10; $i++) {
    $url = "https://nhotuvung.com/vocab/?id=ETS-LC-$i"
    Write-Host "Fetching $url ..."
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing
    
    $startIndex = $response.Content.IndexOf('let data = [')
    if ($startIndex -gt 0) {
        $startIndex += 11
        $endIndex = $response.Content.IndexOf('// data = data.slice(0, 5);', $startIndex)
        if ($endIndex -gt 0) {
            $jsonString = $response.Content.Substring($startIndex, $endIndex - $startIndex).Trim()
            if ($jsonString.EndsWith(";")) {
                $jsonString = $jsonString.Substring(0, $jsonString.Length - 1)
            }
            try {
                $vocabList = $jsonString | ConvertFrom-Json
                foreach ($item in $vocabList) {
                    $item | Add-Member -MemberType NoteProperty -Name "_album" -Value "ETS-LC-$i"
                }
                $allData += $vocabList
                Write-Host " > Found $($vocabList.Count) items."
            } catch {
                Write-Host " > Error parsing JSON for album $i"
            }
        }
    } else {
        Write-Host " > Could not find 'let data = ' in album $i"
    }
}

$allData | ConvertTo-Json -Depth 10 | Out-File "ETS_2024_LC_Vocab.json" -Encoding utf8
Write-Host "Done! Total extracted words: $($allData.Count)"
