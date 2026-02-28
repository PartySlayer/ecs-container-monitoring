module "networking" {
  source = "./networking"
}

module "iam" {
  source = "./iam"
}

module "grafana" {
  source = "./grafana"

  vpc_id                    = module.networking.vpc_id
  public_subnet_id          = module.networking.public_subnet_ids[0]
  key_name                  = var.key_name
  iam_instance_profile_name = module.iam.grafana_instance_profile_name
}