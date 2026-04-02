$dataDir = 'c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Toeic-Web-App-React\public\data'
New-Item -ItemType Directory -Force -Path $dataDir | Out-Null

$files = @(
  @{src='c:\Users\Laptop\OneDrive\Desktop\Toeic Data\30_Days_TOEIC.json'; key='30_days'},
  @{src='c:\Users\Laptop\OneDrive\Desktop\Toeic Data\ETS_2024_LC_Vocab.json'; key='ets_lc'},
  @{src='c:\Users\Laptop\OneDrive\Desktop\Toeic Data\ETS_2024_RC_Vocab.json'; key='ets_rc'},
  @{src='c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Listening_Topics.json'; key='listening_topics'},
  @{src='c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Part7_Topics.json'; key='part7_topics'}
)

foreach ($f in $files) {
  Write-Host "Processing $($f.key)..."
  $data = Get-Content $f.src -Raw | ConvertFrom-Json
  $total = $data.Count
  $albums = $data | Group-Object -Property _album | Select-Object Name, Count
  Write-Host "  Total: $total words, Albums: $($albums.Count)"
  foreach ($a in $albums | Select-Object -First 10) {
    Write-Host "    $($a.Name): $($a.Count) words"
  }
}
