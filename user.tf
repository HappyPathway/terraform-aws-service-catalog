resource "aws_iam_user" "build_user" {
  name = var.portfolio.name
  path = "/service-catalog/${var.portfolio.name}/"
  tags = {
    Portfolio_Name = var.portfolio.name
    Account_ID     = local.account_id
    Region         = local.region
  }
}

resource "aws_iam_access_key" "build_user" {
  user = aws_iam_user.build_user.name
}

resource "aws_iam_user_policy" "build_user" {
  name   = "${var.portfolio.name}-build-user"
  user   = aws_iam_user.build_user.name
  policy = var.build_permissions_iam_doc.json
}
