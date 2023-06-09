resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.acm_validation_method

  tags = {
    Name=var.team_name
    Email=var.email
  }
     
  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_acm_certificate_validation" "cert_validation" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.route53_records : record.fqdn]
# }

