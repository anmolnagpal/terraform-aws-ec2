variable "ami" {
  description = "The AMI ID to use for the instance"
}

variable "instance_type" {
  description = "The type of the instance"
  default     = "t2.micro"
}

variable "ssh_key_pair" {
  description = "SSH key pair to be provisioned on the instance"
}

variable "subnet" {
  description = "VPC Subnet ID the instance is launched in"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "root_volume_type" {
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "Size of the root volume in gigabytes"
  default     = "8"
}

variable "delete_on_termination" {
  description = ""
  default     = false
}

variable "name" {
  description = "Name  (e.g. `bastion` or `db`)"
}

variable "env" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "create_default_security_group" {
  description = "Create default Security Group with only Egress traffic allowed"
  default     = "true"
}

variable "vpc_id" {
  description = "The ID of the VPC that the instance security group belongs to"
}

variable "allowed_ports" {
  type        = "list"
  description = "List of allowed ingress ports"
  default     = []
}

variable "security_groups" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = "list"
  default     = []
}

variable "assign_eip_address" {
  description = "Assign an Elastic IP address to the instance"
  default     = "true"
}
