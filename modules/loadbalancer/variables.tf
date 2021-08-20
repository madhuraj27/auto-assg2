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

variable "lb_name" {
  default = "g5_lb"
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

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "lb_net" {
  default = "lb_nic"
}

variable "vmlinux_nic" {
  
}

variable "vm_nic_ipconfig" {
  
}
