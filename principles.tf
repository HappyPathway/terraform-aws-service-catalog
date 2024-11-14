resource "aws_servicecatalog_principal_portfolio_association" "users" {
  for_each      = toset(var.principals)
  portfolio_id  = local.portfolio.id
  principal_arn = each.value
  principal_type = var.principal_type
}
