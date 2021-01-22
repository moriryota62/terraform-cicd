data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count = length(var.subnet_public_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_public_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index + 1]

  tags = merge(
    {
      "Name"                                   = "${var.base_name}-public-subnet-${count.index}"
    },
    var.tags
  )
}

resource "aws_subnet" "private" {
  count = var.subnet_private_cidrs == null ? 0 : length(var.subnet_private_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index + 1]

  tags = merge(
    {
      "Name"                                   = "${var.base_name}-private-subnet-${count.index}",
    },
    var.tags
  )
}
