resource "aws_vpc" "arush" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.arush.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "ram"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.arush.id

  tags = {
    Name = "best"
  }
}
resource "aws_default_route_table" "raj_table" {
  default_route_table_id = aws_vpc.arush.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "test"
  }
}
resource "route_table_association" "amit" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_default_route_table.raj_table.id
}