resource "aws_iam_user" "build_user" {
  name = var.product_name
  path = "/service-catalog/${var.product_name}/"
  tags = {
    Product_Name = var.product_name
    Account_ID   = local.account_id
    Region       = local.region
  }
}

resource "aws_iam_access_key" "build_user" {
  user = aws_iam_user.build_user.name
}

resource "aws_iam_user_policy" "build_user" {
  name   = "${var.product_name}-build-user"
  user   = aws_iam_user.build_user.name
  policy = var.build_permissions_iam_doc.json
}