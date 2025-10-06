# Create an S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "flipkart-bucket-terraform-infra3tire-demo"
}

# Enable versioning separately
resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.example_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}