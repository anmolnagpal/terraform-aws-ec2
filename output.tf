output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = "${coalesce(join("", aws_eip.eip.*.public_ip), join("", aws_instance.ec2.*.public_ip))}"
}

output "private_ip" {
  description = "Private IP of instance"
  value       = "${join("", aws_instance.ec2.*.private_ip)}"
}

output "private_dns" {
  description = "Private DNS of instance"
  value       = "${join("", aws_instance.ec2.*.private_dns)}"
}

output "id" {
  description = "Disambiguated ID of the instance"
  value       = "${join("", aws_instance.ec2.*.id)}"
}

output "ssh_key_pair" {
  description = "Name of the SSH key pair provisioned on the instance"
  value       = "${var.ssh_key_pair}"
}

output "security_group_ids" {
  description = "IDs on the AWS Security Groups associated with the instance"
  value       = "${compact(concat(list(var.create_default_security_group == "true" ? join("", aws_security_group.default.*.id) : ""), var.security_groups))}"
}

output "primary_network_interface_id" {
  description = "ID of the instance's primary network interface"
  value       = "${join("", aws_instance.ec2.*.primary_network_interface_id)}"
}

output "network_interface_id" {
  description = "ID of the network interface that was created with the instance"
  value       = "${join("", aws_instance.ec2.*.network_interface_id)}"
}
