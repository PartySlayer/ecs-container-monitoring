variable "aws_region" {
  description = "Regione AWS"
  default     = "eu-west-1" # per il progetto terraLAB
}

variable "project_name" {
  description = "Nome del progetto (usato nei prefissi)"
  default     = "serverless-observability-ecs-0x0"
}

variable "environment" {
  description = "L'ambiente a cui sono riferite le risorse all'interno dello stato remoto"
  default     = "sviluppo"
}
