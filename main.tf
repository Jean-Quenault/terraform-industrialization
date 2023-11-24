provider "aws" {
    region = "eu-west-3"
}


# Variable "vpc_id" is passed to the module "front". Variable declared in ./variable.tf and defined in ./terraform.ttvars.
# "Front" module received this variable in his own ./modules/front/variable.tf file.

module "front" {
  source            = "./modules/front"
  vpc_id            = var.vpc_id
  region            = var.region
  ecr_url           = var.ecr_url
  certificate_front = var.certificate_front
  front_port        ="80"
  front_image       ="front"
  front_image_tag   ="13"
}

module "back" {
  source            = "./modules/back"
  vpc_id            = var.vpc_id
}

