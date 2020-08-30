data "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "main-a-record" {
   zone_id = data.aws_route53_zone.main.zone_id
   name = var.domain_name
   type = "A"
   alias {
    name = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}