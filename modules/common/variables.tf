variable "law_name" {
  default = "law-group5"
}

variable "rg_name" {
  default = "group5-assignment1-rg"
}

variable "location" {
  default = "canadacentral"
}

locals {
  common_tags = {
    Name           = "Terraform Group Project"
    GroupMembers   = "Himani, Parinda, Madhura"
    ExpirationData = "2021-07-31"
    Environment    = "Lab"
  }
}

variable "sku_law" {
  default = "Standard"
}

variable "retention_in_days" {
  default = "30"
}

variable "sv_name" {
  default = "service-vault-group5"
}

variable "sku_vault" {
  default = "Standard"
}

variable "storage_acc" {
  default = "storagegroup5assg1"
}

variable "acc_tier" {
  default = "Standard"
}

variable "replication_type" {
  default = "LRS"
}

variable "storage_container" {
default = "storage-container"
}

variable "storage_blob" {
default = "storage-blob"
}

variable "subnet1" {
  default = "lab01-subnet1"
}

variable "subnet1_space" {
  default = ["10.0.4.0/24"]
}

variable "subnet_id" {
  description = " The default subnet id "
}


