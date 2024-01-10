resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "codepipeline_bucket_ownership_control" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "codepipeline_bucketacl" {
  depends_on = [aws_s3_bucket_ownership_controls.codepipeline_bucket_ownership_control]

  bucket = aws_s3_bucket.codepipeline_bucket.id
  acl    = "private"
}