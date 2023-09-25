provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    key_name = "ido_key"
    security_groups = [aws_security_group.webtraffic.name]
    
}

resource "aws_security_group" "webtraffic"{
    name = "allow HTTPs"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

}