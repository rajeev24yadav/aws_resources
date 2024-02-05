
resource "aws_instance" "test_instance" {
  for_each      = var.aws_ec2
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = "subnet-00e0adb1489403dbe"
  key_name      = "terraform"

  tags = {
    Name = each.vale.name
  }
}
