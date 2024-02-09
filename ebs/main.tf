resource "aws_volume_attachment" "ebs_att" {
  for_each    = var.data_valume
  device_name = each.value.device_name
  volume_id   = each.value.volume_id
  instance_id = each.value.instance_id
}
resource "aws_instance" "web" {
  for_each          = var.data_valume
  ami               = each.value.ami
  availability_zone = each.value.availability_zone
  instance_type     = each.value.instance_type

  tags = {
    Name = each.value.Name
  }
}

resource "aws_ebs_volume" "arush" {
  for_each          = var.data_valume
  availability_zone = each.value.availability_zone
  size              = 40
}