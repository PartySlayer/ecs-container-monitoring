terraform {
  backend "s3" {
    bucket         = "serverless-observability-ecs-0x0-tf-state-sviluppo"
    key            = "global/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "serverless-observability-ecs-0x0-tf-state-sviluppo"
    encrypt        = true
  }
}
