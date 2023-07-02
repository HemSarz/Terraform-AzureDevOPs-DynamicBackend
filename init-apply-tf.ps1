Write-Host "Initializing the backend..."
terraform init
Write-Host "Creating or modifying the infrastructure | Add backend"
terraform apply -auto-approve