resource "aws_ecs_service" "app" {
  name            = "ecs-observability-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = "app"
    container_port   = 80
  }

  depends_on = [
    aws_lb_listener.http
  ]
}
