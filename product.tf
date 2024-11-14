resource "aws_servicecatalog_product" "product" {
  count = var.create_product ? 1 : 0
  name  = var.product_name
  owner = var.product_owner
  type  = "EXTERNAL"

  provisioning_artifact_parameters {
    template_url = "https://s3.amazonaws.com/${var.s3_bucket}/${var.product_name}"
    type = "EXTERNAL"
    disable_template_validation = true
  }
  tags = var.product_tags
}

data "aws_servicecatalog_product" "product" {
  count = var.create_product ? 0 : 1
  id    = var.product_id
}

locals {
  product = var.create_product ? one(aws_servicecatalog_product.product) : one(data.aws_servicecatalog_product.product)
}


resource "aws_servicecatalog_product_portfolio_association" "product_portfolio" {
  portfolio_id = local.portfolio.id
  product_id   = local.product.id
}
