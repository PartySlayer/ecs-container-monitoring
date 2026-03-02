resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/ecs-observability-app"
  retention_in_days = 7
}
