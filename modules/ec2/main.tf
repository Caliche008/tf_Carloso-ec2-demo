resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.this.private_key_pem
  filename = var.private_key_path
}

resource "aws_instance" "this" {
  for_each = var.ec2_config

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  
  # Usamos lookup para vincular el ID del Security Group que viene del otro módulo
  vpc_security_group_ids = [lookup(var.security_group_ids, each.key, null)]
  
  # Usamos lookup para vincular el Profile de IAM que viene del módulo IAM
  iam_instance_profile   = lookup(var.iam_instance_profiles, each.key, null)
  
  key_name               = aws_key_pair.this.key_name
  subnet_id              = each.value.subnet_id

  root_block_device {
    volume_size = each.value.root_block_device.volume_size
    volume_type = each.value.root_block_device.volume_type
    iops        = each.value.root_block_device.iops
  }

  volume_tags = merge(
    each.value.tagsec2,
    var.tags
  )

  tags = merge(
    each.value.tagsec2,
    var.tags
  )
}