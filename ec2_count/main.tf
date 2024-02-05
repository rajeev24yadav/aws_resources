
resource "aws_instance" "test_instance" {
  count         = length(var.aws_ec2)
  ami           = var.aws_ec2[count.index].ami
  instance_type = var.aws_ec2[count.index].instance_type
  subnet_id     = "subnet-00e0adb1489403dbe"
  key_name      = "terraform"
}
