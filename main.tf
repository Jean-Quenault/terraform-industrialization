provider "aws" {
    region = "eu-west-3"
}


# Variable "vpc_id" is passed to the module "front". Variable declared in ./variable.tf and defined in ./terraform.ttvars.
# "Front" module received this variable in his own ./modules/front/variable.tf file.

module "front" {
  source            = "./modules/front"
  vpc_id            = var.vpc_id
  region            = var.region
  ecr_front_url     = var.ecr_front_url
  certificate_front = var.certificate_front
  subnet            = var.subnet
  front_port        ="80"
  front_image       ="front"
  front_image_tag   ="13"
}

module "back" {
  source            = "./modules/back"
  region            = var.region
  vpc_id            = var.vpc_id
  subnet            = var.subnet
  ecr_back_url      = var.ecr_back_url
  back_port        ="4000"
  back_image       ="back"
  back_image_tag   ="13"
}