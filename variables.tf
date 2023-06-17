
#variable "Client_Secret" {
#  type        = string
#name        = SPNPass
##value       = azuread_service_principal_password.tfazsp.value
#description = "description"
#s}

variable "tenant_id" {
  type        = string
  default     = "2b203c53-c460-43ff-88b3-cb8bb33c3fa9"
  description = "description"
}

variable "subscription_id" {
  type        = string
  default     = "60b8226d-3048-4a92-b759-c99f388752a1"
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

variable "stg_access_key" {
  type        = string
  default     = ""
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

variable "object_id_spn" {
  type        = string
  default     = "af3acd9c-9046-4786-9ad2-4ff46860f428"
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