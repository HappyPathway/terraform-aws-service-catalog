resource "aws_iam_role" "launch_role" {
  name                = "SCLaunch-${var.product_name}"
  assume_role_policy  = templatefile(
    "${path.module}/trust_policy.json",
    {
      partition = local.partition,
      account_id = local.account_id
    }
  )
  
  inline_policy {
    name   = var.product_name
    policy = var.launch_role_policy
  }
}

resource "aws_servicecatalog_constraint" "constraint" {
  description  = var.constraint_description
  portfolio_id = one(local.portfolio).id
  product_id   = one(local.product).id
  type         = "LAUNCH"

  parameters = jsonencode({
    "RoleArn" : aws_iam_role.launch_role.arn
  })
}

output launch_role {
  value = aws_iam_role.launch_role
}