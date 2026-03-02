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

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ecs_security_group_ingress_port" {
  description = "Port ECS service listens on"
  type        = number
  default     = 80
}

variable "ecs_task_execution_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ECS task role ARN"
  type        = string
}
