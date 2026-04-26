variable "env" {}
variable "ami" {}
variable "instance_type" {}
variable "sg_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "tg_arn" {}
variable "key_name" {}