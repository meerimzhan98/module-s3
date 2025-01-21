resource "aws_s3_bucket" "my-unique-bucket-mjjj" {
  bucket = var.bucket_name_mj
  tags = {
    "managed-by" = "terraform"
  }
}

# resource "aws_s3_bucket_acl" "module-s3" {
#   bucket = aws_s3_bucket.my-unique-bucket-mjjj.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.my-unique-bucket-mjjj.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.my-unique-bucket-mjjj.id

  rule {
    id = "my-rule"

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "GLACIER_IR"
    }
  }
}