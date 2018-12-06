# terraform-aws-ec2

Example of usage
------------------------------------------

```hcl
module "this" {
  source                      = "github.com/anmolnagpal/terraform-aws-ec2"
  name                        = "${var.name}"
  env                         = "${var.env}"
  vpc_id                      = "${var.vpc_id}"
  subnet                      = "${var.subnet}"
  ami                         = "${var.ami}"
  ssh_key_pair                = "${var.ssh_key_pair}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  root_volume_type            = "${var.root_volume_type}"
  root_volume_size            = "${var.root_volume_size}"
  allowed_ports               = "${var.allowed_ports}"
  assign_eip_address          = "${var.assign_eip_address}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name  (e.g. `bastion` or `db`) | string | - | yes |
| env | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| instance\_type | The type of the instance | string | `t2.micro` | no |
| vpc\_id | The ID of the VPC that the instance security group belongs to | string | - | yes |
| subnet | VPC Subnet ID the instance is launched in | string | - | yes |
| ami | The AMI ID to use for the instance | string | - | yes |
| ssh\_key\_pair | SSH key pair to be provisioned on the instance | string | - | yes |
| associate\_public\_ip\_address | Associate a public IP address with the instance | string | `true` | no |
| root\_volume\_type | Type of root volume. Can be standard, gp2 or io1 | string | `gp2` | no |
| root\_volume\_size | Size of the root volume in gigabytes | string | `8` | no |
| create\_default\_security\_group | Create default Security Group with only Egress traffic allowed | string | `true` | no |
| allowed\_ports | List of allowed ingress ports | list | [] | no |
| security\_groups | List of Security Group IDs allowed to connect to the instance | list | [] | no |
| assign\_eip\_address | username password | string | - | yes |
| delete\_on\_termination | delete root ebs volume on instance termination | string | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the instance |
| public\_ip | Public IP of instance (or EIP) |
| private\_ip | Private IP of instance |
| private\_dns | Private DNS of instance |
| ssh\_key\_pair | Name of the SSH key pair provisioned on the instance |
| security\_group\_ids | IDs on the AWS Security Groups associated with the instance |
| primary\_network\_interface\_id | ID of the instance's primary network interface |
| network\_interface\_id | ID of the network interface that was created with the instance |
