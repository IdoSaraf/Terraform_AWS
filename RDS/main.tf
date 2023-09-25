provider "aws" {
    region = "us-west-2"
}


resource "aws_db_instance" "myRDS"{
    db_name = "myDB"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_verion = "10.2.21"
    username = "ido"
    password = "snfloksn"
    port = 330
    allocated_storage = 20
    skip_final_snapshsot = true

}