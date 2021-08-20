variable "server_name" {
  default = "postgresql-server-g5"
}

variable "location" {
  default = "Canadacentral"
}

variable "rg_name" {
  default = "group5-assignment1-rg"
}

variable "db_name" {
  default = "postgresql-db"
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

