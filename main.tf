provider "aws" {
    region = "eu-west-3"
}


# Variable "vpc_id" is passed to the module "front". Variable declared in ./variable.tf and defined in ./terraform.ttvars.
# "Front" module received this variable in his own ./modules/front/variable.tf file.

module "front" {
  source  = "./modules/front"
  vpc_id  = var.vpc_id
}

module "back" {
  source  = "./modules/back"
  vpc_id  = var.vpc_id
}

