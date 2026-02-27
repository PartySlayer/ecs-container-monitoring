output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "monitoring_role_arn" {
  value = aws_iam_role.monitoring_role.arn
}

output "grafana_instance_profile_name" {
  value = aws_iam_instance_profile.grafana_profile.name
}
