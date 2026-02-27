resource "aws_ecr_repository" "app" {
  name                 = "ecs-observability-app"
  image_tag_mutability = "MUTABLE"
}
