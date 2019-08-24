resource "aws_instance" "server" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "c5.2xlarge"
  subnet_id                   = "${var.subnet_id}"
  key_name                    = "pb"
  associate_public_ip_address = true
  security_groups             = ["${var.security_group_id}"]

  tags = {
    Name = "pb"
  }
}

output "ip" {
  value = "${aws_instance.server.public_ip}"
}
