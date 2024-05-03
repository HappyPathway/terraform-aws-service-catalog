#Artifact Bucket
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = regex("[a-z0-9.-]+", lower(var.s3_bucket))
  tags          = var.s3_tags
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "bucket_access" {
  bucket                  = aws_s3_bucket.bucket.id
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
}

resource "aws_s3_bucket_policy" "bucket_policy_bucket" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy_doc_bucket.json
}

data "aws_iam_policy_document" "bucket_policy_doc_bucket" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_role.bucket_role.arn]
    }

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:ReplicateObject",
      "s3:PutObject",
      "s3:RestoreObject",
      "s3:PutObjectVersionTagging",
      "s3:PutObjectTagging",
      "s3:PutObjectAcl"
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  bucket        = aws_s3_bucket.bucket.id
  target_bucket = aws_s3_bucket.bucket.id
  target_prefix = "log/"
}
