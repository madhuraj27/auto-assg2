variable "vmlinux_name" {
  type = map(string)
  default = {
    hum0964-c-vm1 = "Standard_B1s"
    hum0964-c-vm2 = "Standard_B1ms"
  }
}

variable "avs" {
  default = "linux_avs"
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

variable "os_disk_attributes" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

variable "ubuntu_os_info" {
  type = map(string)
  default = {
    los_publisher = "OpenLogic"
    los_offer     = "CentOS"
    los_sku       = "7.5"
    los_version   = "latest"
  }
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

variable "storage_account" {
  
}
