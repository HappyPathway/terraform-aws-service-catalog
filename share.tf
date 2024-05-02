resource "aws_servicecatalog_portfolio_share" "account_shares" {
  for_each     = toset(var.account_shares)
  principal_id = each.value
  portfolio_id = local.portfolio.id
  type         = "ORGANIZATION_MEMBER_ACCOUNT"
}