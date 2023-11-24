# Main declaration of vpc_id.

variable "vpc_id" {
  description = "ID of the choosen VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet" {
  description = "Front and back load balancer subnet"
  type        = string
}

// Front 

variable "ecr_front_url" {
  description = "ECR front URL"
  type        = string
}

variable "certificate_front" {
  description = "Front certificate ARN"
  type        = string
}


// Back 

variable "ecr_back_url" {
  description = "ECR front URL"
  type        = string
}