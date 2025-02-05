data "aws_iam_policy_document" "s3_access" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

data "aws_partition" "current" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  user_arn   = data.aws_caller_identity.current.arn
}

module "example_catalog_product" {
  source                    = "../"
  constraint_description    = "Example Catalog Product"
  portfolio_provider        = "Infrastructure Engineering"
  portfolio_description     = "Test portfolio"
  portfolio_name            = "dev-terraform"
  s3_bucket                 = "census-csvd-terraform-service-catalog"
  product_owner             = "csvd_users"
  product_description       = "test bucket for terraform service-catalog products"
  product_name              = "test-s3-bucket"
  product_owner_org         = "CSVD"
  build_permissions_iam_doc = data.aws_iam_policy_document.s3_access
  s3_bucket_role            = "service-catalog-s3"
  principals = [
    "arn:aws-us-gov:iam::${local.account_id}:role/aws-reserved/sso.amazonaws.com/${local.region}/AWSReservedSSO_inf-admin-t2_4e0c6446aecbe4a0"
  ]
  principal_type = "IAM"
  account_shares = [
  ]
  launch_role_policy = templatefile("${path.root}/s3_policy.json",
    {
      partition = local.partition
    }
  )
}

output "launch_role" {
  value = module.example_catalog_product.launch_role
}
