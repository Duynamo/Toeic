$allData = @()

for ($i = 1; $i -le 10; $i++) {
    $url = "https://nhotuvung.com/vocab/?id=ETS-RC-$i"
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
                    $item | Add-Member -MemberType NoteProperty -Name "_album" -Value "ETS-RC-$i"
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

$allData | ConvertTo-Json -Depth 10 | Out-File "ETS_2024_RC_Vocab.json" -Encoding utf8

$csvData = @()
foreach ($item in $allData) {
    if ($item.song_ngu -and $item.song_ngu.Count -ge 2) {
        $exampleEng = $item.song_ngu[0] -replace '<[^>]+>', ''
        $exampleVie = $item.song_ngu[1] -replace '<[^>]+>', ''
    } else {
        $exampleEng = ""
        $exampleVie = ""
    }
    
    $obj = [PSCustomObject]@{
        Album = $item._album
        Word = $item.tu_vung
        Meaning = $item.y_nghia
        PartOfSpeech = $item.tu_loai
        Pronunciation = $item.phien_am
        Example_English = $exampleEng
        Example_Vietnamese = $exampleVie
    }
    $csvData += $obj
}

$csvData | Export-Csv -Path ETS_2024_RC_Vocab.csv -NoTypeInformation -Encoding UTF8
Write-Host "Done! Total extracted words: $($allData.Count)"
