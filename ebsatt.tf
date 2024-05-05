resource "aws_volume_attachment" "ebs_att" {
  count       = var.env == "Dev" ? 1 : 3
  device_name = "/dev/sdh"
  volume_id   = element(aws_ebs_volume.EBS-Vol.*.id, count.index)
  instance_id = element(aws_instance.WebServer.*.id, count.index)
}