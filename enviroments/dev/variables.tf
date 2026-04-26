# environments/dev/variables.tf

variable "env" {
  type        = string
  description = "Deployment environment name"
}

variable "vpc_cidr" {
  type        = string
}

variable "public_subnet_1_cidr" {
  type        = string
}

variable "public_subnet_2_cidr" {
  type        = string
}

variable "private_subnet_cidr" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "ami_id" {
  type        = string
}

variable "key_name" {
  type        = string
}