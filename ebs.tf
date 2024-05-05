resource "aws_ebs_volume" "EBS-Vol" {
  count             = var.env == "Dev" ? 1 : 3
  availability_zone = element(var.az, count.index)
  size              = 2
  tags = {
    Name = "${var.vpc_name}-EBS-${count.index + 1}"
  }
}