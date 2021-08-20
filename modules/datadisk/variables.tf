variable "vm_name" {
  type = map(string)
  default = {
    g5-linux-vm1   = "Standard_B1s"
    g5-linux-vm2   = "Standard_B1ms"
    g5-windows-vm1 = "Standard_B1s"
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

variable "storage_acc" {
  default = "storage_group5"
}

variable "storage_container" {
  default = "storage_container"
}

variable "storage_blob" {
  default = "storage_blob"
}

variable "data_disk" {
  default = "data-disk"
}

variable "storage_acc_type" {
  default = "Standard_LRS"
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

variable "vmlinux_name" {
  type = list(string)
  default = [
    "g5-linux-vm1",
    "g5-linux-vm2"
  ]
}

variable "windows_name" {
  type = list(string)
  default = [
    "g5-windows-vm1"
  ]
}

variable "vmlinux_id" {

}

variable "nb_count_linux" {
  default = "2"
}

variable "nb_count_windows" {
  default = "1"
}

variable "vmwindows_id" {

}
