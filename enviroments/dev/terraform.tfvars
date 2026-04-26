# environments/dev/terraform.tfvars

env                  = "dev"
vpc_cidr             = "10.0.0.0/16"
public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"
private_subnet_cidr  = "10.0.3.0/24"

ami_id               = "ami-0f5ee92e2d63afc18"
instance_type        = "t3.micro"
key_name             = "my-test"