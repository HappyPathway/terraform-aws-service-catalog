terraform {
  backend "s3" {
    bucket         = "inf-tfstate-us-gov-west-1-229685449397"
    key            = "csvd-dev-gov/common/apps/aws-service-catalog"
    region         = "us-gov-west-1"
    dynamodb_table = "tf_remote_state"
  }
}

