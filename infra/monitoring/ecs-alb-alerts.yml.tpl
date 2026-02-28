groups:
- name: ecs-alerts
  rules:
  - alert: ECSHighCPU
    expr: aws_ecs_cpuutilization_average > 80
    for: 2m
    labels:
      severity: warning
    annotations:
      summary: "High ECS CPU usage"
      description: "ECS service CPU utilization is above 80% for 2 minutes."

  - alert: ECSHighMemory
    expr: aws_ecs_memory_utilization_average > 80
    for: 2m
    labels:
      severity: warning
    annotations:
      summary: "High ECS Memory usage"
      description: "ECS service memory utilization is above 80% for 2 minutes."

- name: alb-alerts
  rules:
  - alert: ALB5XXErrors
    expr: aws_applicationelb_httpcode_target_5xx_count_sum > 0
    for: 1m
    labels:
      severity: critical
    annotations:
      summary: "ALB 5XX errors detected"
      description: "Application Load Balancer is returning 5XX errors."

  - alert: ALBHighResponseTime
    expr: aws_applicationelb_target_response_time_average > 1.5
    for: 2m
    labels:
      severity: warning
    annotations:
      summary: "High ALB response time"
      description: "ALB target response time is above 1.5 seconds."
