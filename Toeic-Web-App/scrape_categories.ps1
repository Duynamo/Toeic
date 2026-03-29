$targets = @(
    @{ Url = "https://nhotuvung.com/tu-vung-trong-phan-nghe-theo-chu-de/"; Name = "Listening_Topics" },
    @{ Url = "https://nhotuvung.com/tu-vung-part-7-theo-chu-de/"; Name = "Part7_Topics" },
    @{ Url = "https://nhotuvung.com/30-ngay-tu-vung-toeic-reading-listening/"; Name = "30_Days_TOEIC" }
)

foreach ($target in $targets) {
    $mainUrl = $target.Url
    $name = $target.Name
    Write-Host "`n=================================="
    Write-Host "Processing $name ($mainUrl) ..."
    
    $response = Invoke-WebRequest -Uri $mainUrl -UseBasicParsing
    $content = $response.Content
    
    $matches = [regex]::Matches($content, 'nhotuvung\.com/vocab/\?id=([^"''&\s>]+)')
    $albumIds = @()
    foreach ($m in $matches) {
        $albumIds += $m.Groups[1].Value
    }
    $albumIds = $albumIds | Select-Object -Unique

    Write-Host "Found $($albumIds.Count) albums for $name"
    
    $allData = @()

    foreach ($id in $albumIds) {
        $url = "https://nhotuvung.com/vocab/?id=$id"
        Write-Host "  Fetching album $id ..."
        $res = Invoke-WebRequest -Uri $url -UseBasicParsing
        
        $startIndex = $res.Content.IndexOf('let data = [')
        if ($startIndex -gt 0) {
            $startIndex += 11
            $endIndex = $res.Content.IndexOf('// data = data.slice(0, 5);', $startIndex)
            if ($endIndex -gt 0) {
                $jsonString = $res.Content.Substring($startIndex, $endIndex - $startIndex).Trim()
                if ($jsonString.EndsWith(";")) {
                    $jsonString = $jsonString.Substring(0, $jsonString.Length - 1)
                }
                try {
                    $vocabList = $jsonString | ConvertFrom-Json
                    foreach ($item in $vocabList) {
                        $item | Add-Member -MemberType NoteProperty -Name "_album" -Value $id
                    }
                    $allData += $vocabList
                    Write-Host "  > Found $($vocabList.Count) items."
                } catch {
                    Write-Host "  > Error parsing JSON for album $id"
                }
            }
        } else {
            Write-Host "  > Could not find 'let data = ' in album $id"
        }
    }

    if ($allData.Count -gt 0) {
        $allData | ConvertTo-Json -Depth 10 | Out-File "$name.json" -Encoding utf8

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
                Category = $name
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

        $csvData | Export-Csv -Path "$name.csv" -NoTypeInformation -Encoding UTF8
        Write-Host "Done $name! Total extracted words: $($allData.Count)"
    } else {
        Write-Host "No data extracted for $name."
    }
}
