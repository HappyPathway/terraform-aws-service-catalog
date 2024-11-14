# Missing Vraiables:  [
#     "create_product",
#     "product_owner",
#     "product_id",
#     "product_tags",
#     "product_name",
#     "s3_bucket"
# ]

# create missing variables
variable "create_product" {
  description = "Flag to create the product"
  type        = bool
  default     = true
}

variable "product_owner" {
  description = "Owner of the product"
  type        = string
}

variable "product_id" {
  description = "ID of the product"
  type        = string
}

variable "product_tags" {
  description = "Tags associated with the product"
  type        = map(string)
  default     = {}
}

variable "product_name" {
  description = "Name of the product"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket for the product"
  type        = string
}

variable "portfolio_id" {
  description = "ID of the portfolio"
  type        = string
}
