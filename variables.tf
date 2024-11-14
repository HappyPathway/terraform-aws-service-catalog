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
#     "principals",
#     "product_description",
#     "product_id",
#     "product_name",
#     "product_owner",
#     "product_tags"
# ]

variable "account_shares" {
  type        = list(string)
  description = "Which organizational AWS accounts should we share this with?"
  default     = []
}


variable "build_permissions_iam_doc" {}
variable "constraint_description" {}

variable "create_portfolio" {
  default = true
}

variable "create_product" {
  default = true
}

variable "launch_role_policy" {
  type = string
}

variable "principal_type" {}
variable "principals" {
  type        = list(string)
  description = "List of principals to share this with"
  default     = []
}

variable "portfolio" {
  type = object({
    name        = string
    provider    = string
    description = string
    id          = optional(string, null)
  })
  default = null
}

variable "products" {
  type = list(object({
    description = string
    id          = optional(string)
    name        = string
    owner       = string
    owner_org   = string
    tags        = optional(map(string), {})
  }))
  default = null
}

variable "s3_bucket" {}
variable "s3_tags" {
  type    = map(string)
  default = {}
}
variable "s3_bucket_role" {}
