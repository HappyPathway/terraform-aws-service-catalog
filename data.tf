data "aws_partition" "current" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_role" "bucket_role" {
  name = var.s3_bucket_role
}

locals {
  partition  = data.aws_partition.current.partition
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  user_arn   = data.aws_caller_identity.current.arn
}