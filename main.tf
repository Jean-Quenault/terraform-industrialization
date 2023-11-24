provider "aws" {
    region = "eu-west-3"
}


# Variable "vpc_id" is passed to the module "front". Variable declared in ./variable.tf and defined in ./terraform.ttvars.
# "Front" module received this variable in his own ./modules/front/variable.tf file.

module "front" {
  source            = "./modules/front"
  vpc_id            = var.vpc_id
  region            = var.region
  ecr_front_url     = "980377181750.dkr.ecr.eu-west-3.amazonaws.com"
  certificate_front = "arn:aws:acm:eu-west-3:980377181750:certificate/dc5fe3dd-2d06-4dad-a754-9ad14ee334cd"
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
  ecr_back_url      = "980377181750.dkr.ecr.eu-west-3.amazonaws.com/back"
  back_port         = "4000"
  back_image        = "back"
  back_image_tag    = "13"
}