provider "aws" {
    region ="us-west-2"   
}

variable "vpcname" {
  type        = string
  default     = "myvpc"
}

variable "sshport" {
  type        = number
  default     = 22
}

variable "enable" {
  default     = "true"
}

variable "mylist" {
  type        = list(string)
  default     = ["value1","value2"]
}

variable "mymap" {
  type        = map
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "inputname" {
  type        = string
  description = "set then name of the vpc"
}


resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        name = var.inputname
    }
}

output vpcid {
  value       = aws_vpc.myvpc.id
  description = "description"
}


variable mytuple {
  type        = tuple([string, number ,string])
  default     = ["cat", 1, "dog"]
  description = "description"
}

variable myobject {
  type        = object({name = string, port =list(number)})
  default     = {
    name = "ido"
    port = [22, 25, 80]
  }
}




