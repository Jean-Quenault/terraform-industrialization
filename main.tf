provider "aws" {
    region = "eu-west-3"
}

resource "aws_instance" "my_ec2_instance" {
    ami = "ami-0302f42a44bf53a45"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform test"
    }
}
