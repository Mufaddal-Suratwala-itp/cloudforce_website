locals {
  mime_types = {
    ".html" = "text/html"
    ".css" = "text/css"
    ".js" = "application/javascript"
    ".ico" = "image/vnd.microsoft.icon"
    ".jpeg" = "image/jpeg"
    ".png" = "image/png"
    ".svg" = "image/svg+xml"
  }
}


resource "aws_s3_bucket" "www_bucket" {
  bucket = var.domain_name
  acl    = "public-read"
  policy = templatefile("s3-policy.json", { bucket = var.domain_name })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.domain_name}"]
    max_age_seconds = 3000
  }
  website {
    index_document = var.index_doc_name
    # error_document = "404.html"
  }
  tags = {

    Name=var.team_name
    Owner=var.email
  }
}


resource "aws_s3_object" "object" {
  for_each = fileset("./web/", "*")
  bucket = aws_s3_bucket.www_bucket.id
  key    = each.value
  source = "./web/${each.value}"
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
   acl="public-read"
}

