variable "vpc_id" {
  description = "ID of the choosen VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet1" {
  description = "ID du premier sous-réseau"
  type        = string
}

variable "subnet2" {
  description = "ID du deuxième sous-réseau"
  type        = string
}

variable "subnet3" {
  description = "ID du troisième sous-réseau"
  type        = string
}
