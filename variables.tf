variable "AZDO_ORG_SERVICE_URL" {
  type        = string
  default     = "https://dev.azure.com/tfazlab"
  description = "description"
}

variable "AZDO_PERSONAL_ACCESS_TOKEN" {
  type        = string
  default     = "f6pvkwade64lhumh7gctvv46zssocb3cr4fz4u7dn3cul55t3s6q"
  description = "description"
}

variable "tenant_id" {
  type        = string
  default     = "7afe75ee-20fb-4e79-93a6-9881f786e2d8"
  description = "description"
}

variable "subscription_id" {
  type        = string
  default     = "64208b73-267b-43b1-9bb1-649f128147e6"
  description = "description"
}

variable "client_id" {
  type        = string
  default     = ""
  description = "description"
}

variable "rg_name" {
  type        = string
  default     = "rg01hh"
  description = "description"
}

variable "VmAdminUser" {
  type        = string
  default     = "heha"
  description = "description"
}

variable "VMAdminPass" {
  type        = string
  default     = "Acer2012."
  description = "description"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "description"
}

variable "location" {
  type        = string
  default     = "norwayeast"
  description = "description"
}

variable "storageAccount_name" {
  type        = string
  default     = "hhstg01"
  description = "description"
}

variable "cont_name" {
  type        = string
  default     = "cont01"
  description = "description"
}

variable "keyvault_name" {
  type        = string
  default     = "kv01h"
  description = "description"
}

variable "AzureAD_ApplicationName" {
  type        = string
  default     = "tfazSPN"
  description = "description"
}


variable "sub-id" {
  type        = string
  default     = "payg"
  description = "description"
}

variable "tfaz-proj" {
  type        = string
  default     = "tfaz-proj-infra"
  description = "description"
}

variable "virtual_network" {
  description = "virtual network address space"
  default     = "10.0.0.0/16"
}
variable "internal_subnet" {
  default = "10.0.2.0/24"
}

variable "vm_name" {
  description = "The name given to the vm"
  default     = "vm-srv01"
}
variable "vm_size" {
  description = "The size of the VM"
  default     = "Standard_A2_v2"
}
variable "storageimage_publisher" {
  description = "The OS image publisher"
  default     = "MicrosoftWindowsServer"
}
variable "storageimage_offer" {
  description = "The OS image offer"
  default     = "WindowsServer"
}
variable "storageimage_sku" {
  description = "The OS SKU"
  default     = "2019-datacenter"
}
variable "storageimage_version" {
  description = "The OS image version"
  default     = "latest"
}
variable "manageddisk_type" {
  description = "The managed disk type for the VM"
  default     = "Standard_LRS"
}