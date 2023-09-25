provider "aws" {
    region = "us-west-2"
}


resource "aws_instance" "DB_Server"{
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
    
}

variable ingressrules {
  type        = list(number)
  default     = [80,443]
}

variable egressrules {
  type        = list(number)
  default     = [80,443]
}

resource "aws_security_group" "webtraffic"{
    name = "my_new_group"

    dynamic "ingress"{
        iterator = port
        for_each = var.ingressrules
        content{
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress"{
        iterator = port
        for_each = var.egressrules
        content{
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
        }
    
    }


resource "aws_eip" "elasticip"{
    instance = aws_instance.DB_Server.id
}

output private_ip {
    value = [aws_eip.elasticip.public_ip]
    
}

output intance_id{
    value = [aws_instance.DB_Server.id]
}

output security_group{
    value = [aws_security_group.webtraffic.name]
}

#output IP {
#  value       = [aws_instance.DB_Server.private_ip]
#}
#"172.31.18.167"