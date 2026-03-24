provider "aws" {
  region = var.region
}

terraform {
    backend "s3"{
        bucket = "terra-form-remote-state-devops-project"
        key = "project/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-lock"
        encrypt = "true"
    }
}

resource "aws_security_group" "project_sg"{
    name = "project_sg"

    ingress{
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
     ingress{
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
     ingress{
        from_port = "3000"
        to_port = "3000"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 
    ingress{
        from_port = "5000"
        to_port = "5000"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "project_server"{
    ami = var.ami
    instance_type = var.instance_type
    key_name =  var.key_name
    security_groups = [aws_security_group.project_sg.name]
    user_data = file("${path.module}/install.sh")
    
}