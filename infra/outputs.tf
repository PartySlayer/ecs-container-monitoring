output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "grafana_instance_id" {
  value = module.grafana.instance_id
}

output "grafana_public_ip" {
  value = module.grafana.public_ip
}

