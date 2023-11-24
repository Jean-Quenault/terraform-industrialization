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
