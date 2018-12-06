resource "aws_security_group" "default" {
  name        = "${var.name}"
  vpc_id      = "${var.vpc_id}"
  description = "Instance default security group (only egress access is allowed)"

  tags {
    Name        = "${var.name}"
    Environment = "${var.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "egress" {
  count             = "${var.create_default_security_group == "true" ? 1 : 0}"
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.default.id}"
}

resource "aws_security_group_rule" "ingress" {
  count             = "${var.create_default_security_group == "true" ? length(compact(var.allowed_ports)) : 0}"
  type              = "ingress"
  from_port         = "${element(var.allowed_ports, count.index)}"
  to_port           = "${element(var.allowed_ports, count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.default.id}"
}
