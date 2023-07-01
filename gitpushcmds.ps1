Write-Host "Running Git commands..."
Write-Host "Executing: git add -A"
git add -A

Write-Host "Executing: git commit -m 'UpdateTFsv1'"
git commit -m "UpdateTFsv1"

Write-Host "Executing: git push -u origin main --force"
git push -u origin main --force