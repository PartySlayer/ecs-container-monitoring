resource "aws_security_group" "grafana_sg" {
  name        = "grafana-sg"
  description = "Grafana access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Grafana UI"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "grafana" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.grafana_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile_name


  user_data = <<-EOF
              #!/bin/bash
              set -eux

              cat << 'EOG' >/etc/yum.repos.d/grafana.repo
              [grafana]
              name=Grafana OSS
              baseurl=https://packages.grafana.com/oss/rpm
              repo_gpgcheck=1
              enabled=1
              gpgcheck=1
              gpgkey=https://packages.grafana.com/gpg.key
              EOG

              dnf install -y grafana
              systemctl enable grafana-server
              systemctl start grafana-server
              EOF

  tags = {
    Name = "grafana-instance"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
