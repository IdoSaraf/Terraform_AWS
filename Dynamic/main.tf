provider "aws" {
    region = "us-west-2"
}

variable ingressrules {
  type        = list(number)
  default     = [80,443]
  description = "description"
}

variable egressrules {
  type        = list(number)
  default     = [80,443,25,3306,53,8080]
  description = "description"
}


resource "aws_instance" "ec2" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    key_name = "ido_key"
    count = "3"
    security_groups = [aws_security_group.webtraffic.name]
    
}

resource "aws_security_group" "webtraffic"{
    name = "allow HTTPs"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

   dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

}