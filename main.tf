###_____    ____   ____
##| ____|  / ___| |___ \
##|  _|   | |       __) |
##| |___  | |___   / __/
##|_____|  \____| |_____|
##

#############################
#  es_cluster_ahs-AZ-A#
#############################

resource "aws_instance" "ec2" {
  ami                                  = "${var.ami}"
  instance_type                        = "${var.instance_type}"
  key_name                             = "${var.ssh_key_pair}"
  instance_initiated_shutdown_behavior = "stop"

  vpc_security_group_ids = [
    "${compact(concat(list(var.create_default_security_group == "true" ? join("", aws_security_group.default.*.id) : ""), var.security_groups))}",
  ]

  subnet_id                   = "${var.subnet}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  #Volume
  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags {
    Name        = "${var.name}"
    Environment = "${var.env}"
  }

  volume_tags {
    Name        = "${var.name}"
    Environment = "${var.env}"
  }
}

resource "aws_eip" "eip" {
  count             = "${var.associate_public_ip_address == "true" && var.assign_eip_address == "true" ? 1 : 0}"
  network_interface = "${aws_instance.ec2.primary_network_interface_id}"
  vpc               = "true"
}
