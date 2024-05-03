locals {
  principals = concat(
    var.principals,
    [    
			local.user_arn
    ]
  )
}

resource "aws_servicecatalog_principal_portfolio_association" "users" {
  for_each      = toset(local.principals)
  portfolio_id  = one(local.portfolio).id
  principal_arn = each.value
}
