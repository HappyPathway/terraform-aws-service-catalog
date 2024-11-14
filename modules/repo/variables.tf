# Missing Vraiables:  [
#     "product_description",
#     "product_owner_org",
#     "product_name",
#     "s3_bucket",
#     "product_owner"
# ]
variable "product_description" {
  description = "Description of the product"
  type        = string
}

variable "product_owner_org" {
  description = "Organization that owns the product"
  type        = string
}

variable "product_name" {
  description = "Name of the product"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "product_owner" {
  description = "Owner of the product"
  type        = string
}
