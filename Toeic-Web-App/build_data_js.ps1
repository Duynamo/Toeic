$destDir = "Toeic-Web-App"
if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir | Out-Null }

$jsonFiles = @("ETS_2024_LC_Vocab.json", "ETS_2024_RC_Vocab.json", "Listening_Topics.json", "Part7_Topics.json", "30_Days_TOEIC.json")
$combinedData = @{
    "ETS_2024_LC" = $null
    "ETS_2024_RC" = $null
    "Listening_Topics" = $null
    "Part7_Topics" = $null
    "30_Days_TOEIC" = $null
}

foreach ($file in $jsonFiles) {
    if (Test-Path $file) {
        $content = Get-Content -Raw -Encoding utf8 $file
        $key = $file.Replace("_Vocab.json", "").Replace(".json", "")
        # Remove BOM if present
        if ($content -match "^\xEF\xBB\xBF") {
            $content = $content.Substring(3)
        }
        $combinedData[$key] = $content | ConvertFrom-Json
    }
}

$jsonOutput = $combinedData | ConvertTo-Json -Depth 10
$jsContent = "const TOEIC_DATA = " + $jsonOutput + ";"
$jsContent | Out-File "$destDir\data.js" -Encoding utf8
Write-Host "data.js generated successfully in $destDir"
