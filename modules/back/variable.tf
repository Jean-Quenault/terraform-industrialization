# Reception of vpc_id variable.

variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "subnets" {
  description = "Front and back load balancer subnet"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecr_back_url" {
  description = "ECR front URL"
  type        = string
}

variable "back_port" {
  description = "Back port"
  type        = number
}

variable "back_image" {
  description = "Image name for Docker"
  type        = string
}

variable "back_image_tag" {
  description = "Tag from Docker image"
  type        = string
}

variable "certificate_back" {
  description = "Back certificate ARN"
  type        = string
}