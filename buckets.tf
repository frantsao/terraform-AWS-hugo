# AWS S3 bucket for static hosting (hugo compliant :-))

resource "aws_s3_bucket" "website" {
  bucket = var.website_bucket_name
  acl = "public-read"
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT","POST"]
    allowed_origins = ["*"]
    expose_headers = ["ETag"]
    max_age_seconds = 3600
  }

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.website_bucket_name}/*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "404.html"
routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "/"
    },
    "Redirect": {
        "ReplaceKeyWith": "index.html"
    }
}]
EOF
  }
}

# That routing rule in S3 avoid 404 errors because the lack of redirections from nice urls ending in / to index.html.
