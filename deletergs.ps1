terraform init
Write-Host "Deleting Azure resource groups..."
az group delete --name rg01hh --yes

Start-Sleep -Seconds 2

Write-Host "Initializing Terraform..."
terraform init -input=false

Start-Sleep -Seconds 2

Write-Host "Destroying infrastructure..."
terraform destroy --auto-approve

Start-Sleep -Seconds 2

Write-Host "Initializing Terraform..."
terraform init