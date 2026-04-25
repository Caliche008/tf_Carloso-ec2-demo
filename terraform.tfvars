cuenta           = "654654478122"
proyecto         = "despliegue-ec2-betek-carloso"
vpc_id           = "vpc-00f479057476a2db8"
key_name         = "carloso"
private_key_path = "./carloso.pem"

tags = {
  "enviroment"    = "dev"
  "desarrollador" = "betek"
  "centro-costos" = "203040"
}

ec2_config = {
  instance_1 = {
    role_name     = "rol-iam-carloso"
    ami           = "ami-0030e4319cbf4dbf2"
    instance_type = "t2.micro"
    subnet_id     = "subnet-00227b47a5f26ec04" 
    policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    policy_arn1   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    
    tagsec2 = {
      Name     = "servidor-carloso"
      "a-tag1" = "web-server"
    }

    root_block_device = {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
    }
  }
}

sg_config = {
  instance_1 = {
    name                 = "ause-sg-654654478122-carloso"
    description          = "Security Group para laboratorio carloso"
    vpc_id               = "vpc-00f479057476a2db8"
    projectsecuritygroup = "sgproyect"
    ingress_rules = [
      { from_port = 3389, to_port = 3389, protocol = "tcp", cidr_blocks = ["10.0.0.0/8"] },
      { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}