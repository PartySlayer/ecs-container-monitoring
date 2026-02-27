variable "project_name" {
  description = "Nome del progetto (usato nei prefissi)"
  default     = "serverless-observability-ecs-0x0"
}

variable "environment" {
  description = "L'ambiente a cui sono riferite le risorse all'interno dello stato remoto"
  default     = "sviluppo"
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile for Grafana EC2"
  type        = string
}


variable "vpc_id" {}
variable "public_subnet_id" {}
variable "key_name" {}
variable "allowed_cidr" {
  default = "0.0.0.0/0"
}