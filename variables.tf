# Required Variables:  [
#     "account_shares",
#     "build_permissions_iam_doc",
#     "constraint_description",
#     "create_portfolio",
#     "create_product",
#     "launch_role",
#     "portfolio_description",
#     "portfolio_id",
#     "portfolio_name",
#     "portfolio_provider",
#     "principles",
#     "product_description",
#     "product_id",
#     "product_name",
#     "product_owner",
#     "product_tags"
# ]

variable "account_shares" {
  type        = list(string)
  description = "Which organizational AWS accounts should we share this with?"
}


variable "build_permissions_iam_doc" {}
variable "constraint_description" {}

variable "create_portfolio" {
  default = true
}

variable "create_product" {
  default = true
}

variable "launch_role" {}

variable "portfolio_description" {}

variable "principles" {
  type        = list(string)
  description = "List of principles to share this with"
}

variable "portfolio_name" {}
variable "portfolio_provider" {}
variable "portfolio_id" {}

variable "product_description" {}
variable "product_id" {}
variable "product_name" {}
variable "product_owner" {}
variable "product_tags" {
  type = map(string)
}

variable "s3_bucket" {}
variable "s3_key" {}