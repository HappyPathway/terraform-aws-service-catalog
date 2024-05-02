resource "aws_servicecatalog_portfolio" "portfolio" {
  count         = var.create_portfolio ? 1 : 0
  name          = var.portfolio_name
  description   = var.portfolio_description
  provider_name = var.portfolio_provider
}

data "aws_servicecatalog_portfolio" "portfolio" {
  count = var.create_portfolio ? 0 : 1
  id    = var.portfolio_id
}

locals {
  portfolio = var.create_portfolio ? aws_servicecatalog_portfolio.portfolio : data.aws_servicecatalog_portfolio.portfolio
}