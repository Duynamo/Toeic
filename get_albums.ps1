$data1 = Get-Content 'c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Listening_Topics.json' -Raw | ConvertFrom-Json
$albums1 = $data1 | Group-Object -Property _album | Select-Object Name, Count | Sort-Object Name
Write-Host "=== LISTENING_TOPICS ==="
foreach ($a in $albums1) { Write-Host "  $($a.Name): $($a.Count)" }

$data2 = Get-Content 'c:\Users\Laptop\OneDrive\Desktop\Toeic Data\Part7_Topics.json' -Raw | ConvertFrom-Json
$albums2 = $data2 | Group-Object -Property _album | Select-Object Name, Count | Sort-Object Name
Write-Host "`n=== PART7_TOPICS ==="
foreach ($a in $albums2) { Write-Host "  $($a.Name): $($a.Count)" }
