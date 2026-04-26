variable "vpc_cidr" {
  description = "CIDR block for VPC"
}


variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
}

variable "env" {
  description = "Environment name (dev/prod)"
}

variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}