resource "aws_servicecatalog_product" "product" {
  count = var.create_product ? 1 : 0
  name  = var.product_name
  owner = var.product_owner
  type  = "TERRAFORM_OPEN_SOURCE"

  provisioning_artifact_parameters {
    template_url = local.template_url
  }
  tags = var.product_tags
}

data "aws_servicecatalog_product" "product" {
  count = var.create_product ? 0 : 1
  id    = var.product_id
}

locals {
  product = var.create_product ? aws_servicecatalog_product.product : data.aws_servicecatalog_product.product
}