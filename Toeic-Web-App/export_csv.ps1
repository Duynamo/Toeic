$data = Get-Content -Raw -Encoding utf8 ETS_2024_LC_Vocab.json | ConvertFrom-Json
$csvData = @()

foreach ($item in $data) {
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

$csvData | Export-Csv -Path ETS_2024_LC_Vocab.csv -NoTypeInformation -Encoding UTF8
Write-Host "CSV generated successfully!"
