data "aws_iam_policy_document" "s3_access" {
  statement {
    effect = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}


module example_catalog_product {
    source = "../"
    constraint_description = "Example Catalog Product"
    portfolio_provider = "Infrastructure Engineering"
    portfolio_description = "Test portfolio"
    portfolio_name = "dev-terraform"
    s3_bucket = "terraform-service-catalog"
    s3_key = "test-s3-bucket"
    product_owner = "csvd_users"
    product_description = "test bucket for terraform service-catalog products"
    product_name = "test-s3-bucket"
    product_owner_org = "CSVD"
    build_permissions_iam_doc = data.aws_iam_policy_document.s3_access
    s3_bucket_role = "service-catalog-s3"
    launch_role = "AWSReservedSSO_inf-admin-t2_4e0c6446aecbe4a0"
}
