locals {
  template_url = "https://s3.amazonaws.com/${var.s3_bucket}/${var.s3_key}"
}

module "product_repo" {
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
      name  = "AWS_SECRET_ACCESS_KEY",
      value = aws_iam_access_key.build_user.secret,
    },
    {
      name  = "AWS_ACCESS_KEY_ID",
      value = aws_iam_access_key.build_user.id,
    }
  ]
  extra_files = [
    {
      path    = ".github/workflows/build.yaml",
      content = file("${path.module}/build.yaml")
    }
  ]
}