resource "aws_servicecatalog_constraint" "example" {
  description  = var.constraint_description
  portfolio_id = local.portfolio.id
  product_id   = local.product.i
  type         = "LAUNCH"

  parameters = jsonencode({
    "RoleArn" : "arn:${local.partition}:iam::${local.account_id}:role/${var.launch_role}"
  })
}