resource "aws_s3_bucket" "this" {
  bucket = "test-${var.environment}-${data.aws_caller_identity.current.account_id}-bucket"
}

# Access block
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}


###EC2####

resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "test-${var.environment}-${data.aws_caller_identity.current.account_id}-instance"
  }
}