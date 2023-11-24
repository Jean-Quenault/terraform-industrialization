# Reception of vpc_id variable.

variable "vpc_id" {
  description = "The ID of the choosen VPC"
  type        = string
}

variable "region" {
  description = "La région AWS où le dépôt ECR est hébergé"
  type        = string
}

variable "ecr_url" {
  description = "L'URL du dépôt Elastic Container Registry"
  type        = string
}

variable "front_port" {
  description = "Le port externe pour le service frontal"
  type        = number
}

variable "front_image" {
  description = "Le nom de l'image Docker pour le service frontal"
  type        = string
}

variable "front_image_tag" {
  description = "Le tag de l'image Docker pour le service frontal"
  type        = string
}

variable "certificate_front" {
  description = "Front certificate ARN"
  type        = string
}
