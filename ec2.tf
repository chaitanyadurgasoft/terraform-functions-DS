resource "aws_instance" "WebServer" {
  count                       = var.env == "Dev" ? 1 : 3
  ami                         = lookup(var.ami, var.region)
  instance_type               = "t2.micro"
  key_name                    = var.key
  subnet_id                   = element(aws_subnet.NewBank-Public-Subnet.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.webserver.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_name}-WebServer-${count.index + 1}"
  }
  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
service nginx start
echo "*************************************************************" 
echo "<h1><center>Web-Server</center></h1>" >> /var/www/html/index.nginx-debian.html
echo "*************************************************************"
echo "<h1><center>${var.vpc_name}-WebServer-${count.index + 1}</center></h1>" >> /var/www/html/index.nginx-debian.html
echo "*************************************************************"
EOF
}
