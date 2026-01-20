resource "aws_instance" "main" {
  count = var.instance_count

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags                        = var.tags

  # Optional: Lifecycle rules if needed
   #lifecycle {
   #  prevent_destroy       = true
  #   create_before_destroy = true
 #  }
}
#############
resource "null_resource" "update_web_server" {
  count = var.instance_count
  triggers = {
    playbook_hash = filemd5("C:\\Users\\Bahi\\Desktop\\cit carrier nti\\technical\\terraform heggy\\day3_lab1\\playbook.yaml")
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = var.private_key_pem
    host        = aws_instance.main[count.index].public_ip
  }
  provisioner "file" {
    source      = "C:\\Users\\Bahi\\Desktop\\cit carrier nti\\technical\\terraform heggy\\day3_lab1\\playbook.yaml"
    destination = "/home/ec2-user/playbook.yml"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install ansible2 -y",
      "ansible-playbook /home/ec2-user/playbook.yml"
    ]
  }
}