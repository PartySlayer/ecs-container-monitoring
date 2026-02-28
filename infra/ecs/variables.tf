variable "project_name" {
  description = "Nome del progetto (usato nei prefissi)"
  default     = "serverless-observability-ecs-0x0"
}

variable "environment" {
  description = "L'ambiente a cui sono riferite le risorse all'interno dello stato remoto"
  default     = "sviluppo"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

