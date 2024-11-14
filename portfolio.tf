resource "aws_servicecatalog_portfolio" "portfolio" {
  count         = var.create_portfolio ? 1 : 0
  name          = var.portfolio.name
  description   = var.portfolio.description
  provider_name = var.portfolio.provider
}

data "aws_servicecatalog_portfolio" "portfolio" {
  count = var.create_portfolio ? 0 : 1
  id    = var.portfolio.id
}

locals {
  portfolio = var.create_portfolio ? one(aws_servicecatalog_portfolio.portfolio) : one(data.aws_servicecatalog_portfolio.portfolio)
}
