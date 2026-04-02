# Copy JSON files to public/data/ for lazy fetching
$src = 'c:\Users\Laptop\OneDrive\Desktop\Toeic Data'
$dst = 'c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Toeic-Web-App-React\public\data'

New-Item -ItemType Directory -Force -Path $dst | Out-Null

$maps = @(
  @{from='30_Days_TOEIC.json'; to='30_days.json'},
  @{from='ETS_2024_LC_Vocab.json'; to='ets_lc.json'},
  @{from='ETS_2024_RC_Vocab.json'; to='ets_rc.json'},
  @{from='Listening_Topics.json'; to='listening_topics.json'},
  @{from='Part7_Topics.json'; to='part7_topics.json'}
)

foreach ($m in $maps) {
  $srcFile = Join-Path $src $m.from
  $dstFile = Join-Path $dst $m.to
  Write-Host "Copying $($m.from) -> $($m.to)..."
  Copy-Item $srcFile $dstFile -Force
  $size = (Get-Item $dstFile).Length / 1MB
  Write-Host "  Done: $([math]::Round($size,2)) MB"
}

Write-Host "All files copied!"
