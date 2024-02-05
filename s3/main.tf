resource "aws_s3_bucket" "bucket-test" {
  for_each = var.bucket
  bucket   = each.value.bucket

}
resource "aws_s3_bucket_accelerate_configuration" "acl" {
  for_each = var.bucket
  bucket   = aws_s3_bucket.bucket-test[each.key].id
  status   = "Enabled"
}
resource "aws_s3_bucket_ownership_controls" "ctls" {
  for_each = var.bucket
  bucket   = aws_s3_bucket.bucket-test[each.key].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl_test" {
  for_each   = var.bucket
  depends_on = [aws_s3_bucket_ownership_controls.ctls]

  bucket = aws_s3_bucket.bucket-test[each.key].id
  acl    = "private"
}
resource "aws_s3_bucket_public_access_block" "bl-test" {
  for_each = var.bucket
  bucket   = aws_s3_bucket.bucket-test[each.key].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}