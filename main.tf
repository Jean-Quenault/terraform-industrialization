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
  subnets            = [var.subnet1, var.subnet2, var.subnet3]
  front_port        ="80"
  front_image       ="front"
  front_image_tag   ="13"
}

module "back" {
  source            = "./modules/back"
  region            = var.region
  vpc_id            = var.vpc_id
  subnets           = [var.subnet1, var.subnet2, var.subnet3]
  ecr_back_url      = "980377181750.dkr.ecr.eu-west-3.amazonaws.com"
  certificate_back = "arn:aws:acm:eu-west-3:980377181750:certificate/699a4f22-8b41-4ac2-98bc-337972b60c49"
  back_port         = "4000"
  back_image        = "back"
  back_image_tag    = "13"
}

