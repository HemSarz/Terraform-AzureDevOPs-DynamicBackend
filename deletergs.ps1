Write-Host "Deleting "backend.tf" & "Terraform folder"..."
Remove-Item -Path "backend.tf" -Force ; Remove-Item -Path ".terraform" -Force -Recurse

Write-Host "Deleting Azure resource groups..."
az group delete --name networkwatcherrg --yes
az group delete --name tfaz-rg-aad --yes

Start-Sleep -Seconds 2

Write-Host "Initializing Terraform..."
terraform init -input=false

Start-Sleep -Seconds 2

Write-Host "Destroying infrastructure..."
terraform destroy --auto-approve

Start-Sleep -Seconds 2

Write-Host "Initializing Terraform..."
terraform init