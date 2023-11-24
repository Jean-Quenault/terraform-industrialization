# Main declaration of vpc_id.

variable "vpc_id" {
  description = "ID of the choosen VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecr_url" {
  description = "ECR URL"
  type        = string
}

variable "cert_front_arn" {
  description = "ARN SSL front certificate"
  type        = string
}
