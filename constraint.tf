resource "aws_iam_role" "launch_role" {
  name = "SCLaunch-${var.portfolio.name}"
  assume_role_policy = templatefile(
    "${path.module}/trust_policy.json",
    {
      partition  = local.partition,
      account_id = local.account_id
    }
  )

  dynamic "inline_policy" {
    for_each = var.products
    content {
      name   = inline_policy.value.name
      policy = var.launch_role_policy
    }
  }
}

resource "aws_servicecatalog_constraint" "constraint" {
  description  = var.constraint_description
  portfolio_id = local.portfolio.id
  product_id   = local.product.id
  type         = "LAUNCH"

  parameters = jsonencode({
    "RoleArn" : aws_iam_role.launch_role.arn
  })
  depends_on = [
    aws_servicecatalog_product_portfolio_association.product_portfolio
  ]
}

output "launch_role" {
  value = aws_iam_role.launch_role
}
