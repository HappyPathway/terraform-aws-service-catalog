module "repo" {
  source  = "HappyPathway/repo/github"
  version = "1.0.0"
  name    = var.product_name

}


module "tfe-tools" {
  source                  = "HappyPathway/repo/github"
  github_codeowners_team  = var.product_owner
  github_repo_description = var.product_description
  name                    = "product-${var.product_name}"
  github_repo_topics = [
    "terraform",
    "service-catalog-product",
  ]
  admin_teams = [
    var.product_owner
  ]
  force_name = true
  secrets = [
    {
      name  = "AWS_SECRET_ACCESS_KEY"
      value = 
    },
    {
      name  = "AWS_ACCESS_KEY_ID"
      value = var.vault_app_role_secret_id
    }
  ]
}