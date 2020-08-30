variable "aws_region" {
type = string
default = "us-east-1"
}
# At this time, you only can get AWS certs to use with CloudFront in us-east-1 zone

variable "domain_name" {
type = string
default = "example.org"
}

variable "website_bucket_name" {
type = string
default = "example.org"
}

variable "website_zone_id" {
type = string
default = "XXRANDOMSTRINGZZYY"
}
