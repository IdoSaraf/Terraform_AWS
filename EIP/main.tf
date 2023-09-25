provider "aws"{
    region = "us-west-2"
}


resource "aws_instance" "ec2" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    key_name = "ido_key"
}

resource "aws_eip" "elasticip"{
    instance = aws_instance.ec2.id
}

output "EIP" {
  value       = "aws.eip.elasticip.public_ip"
}

