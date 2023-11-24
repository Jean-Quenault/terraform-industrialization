# Reception of vpc_id variable.

variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "subnet" {
  description = "Front and back load balancer subnet"
  type        = string
}