
resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = "nodejsterraformbucket-123456" # add a unique suffix to ensure global uniqueness

  tags = {
    Name        = "Nodejs terraform bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "tf_s3_object" {
  for_each = fileset("${path.module}/../public/images", "**")

  bucket = aws_s3_bucket.tf_s3_bucket.bucket
  key    = "images/${each.key}"
  source = "${path.module}/../public/images/${each.key}"

  depends_on = [aws_s3_bucket.tf_s3_bucket]
}

