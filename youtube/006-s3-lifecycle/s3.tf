provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket-davidtest54" # Change this to your desired bucket name
}


resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.example_bucket.id

  rule {
    id     = "lifecycle-rules"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "DEEP_ARCHIVE"
    }
    expiration {
      days = 180
    }
  }

}
