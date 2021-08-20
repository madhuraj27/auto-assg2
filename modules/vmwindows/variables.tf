variable "windows_av_set" {
  default = "windows_avs"
}

variable "windows_name" {
  type = map(string)
  default = {
    hum0964-w-vm1 = "Standard_B1s"
  }
}

variable "username" {
  default = "auto"
}

variable "password" {
  default = "automation@1234"
}

variable "public_key" {
  default = "/home/auto/.ssh/id_rsa.pub"
}

variable "wos_disk_attributes" {
  type = map(string)
  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "127"
    wos_disk_caching         = "ReadWrite"
  }
}

variable "win_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "win_offer" {
  default = "WindowsServer"
}

variable "win_sku" {
  default = "2016-Datacenter"
}

variable "win_version" {
  default = "latest"
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

variable "subnet1" {
  default = "lab01-subnet1"
}

variable "subnet1_space" {
  default = ["10.0.4.0/24"]
}

variable "subnet_id" {
  description = " The default subnet id "
}

variable "storage_acc" {
  default = "storage_group5"
}

variable "storage_container" {
  default = "storage_container"
}

variable "storage_blob" {
  default = "storage_blob"
}

variable "vnet" {
  default = "network-vnet"
}

variable "storage_account" {
  
}
