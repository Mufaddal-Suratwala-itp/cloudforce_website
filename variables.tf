variable "domain_name" {
  default = "complainassist.com"
}

variable "acm_validation_method" {
  default =  "DNS"
}

variable "acm_cert_arn" {
  default = "arn:aws:acm:us-east-1:587172484624:certificate/f22c7f09-cb29-4b0b-98a0-2b23e4835f5f"
}

variable "team_name" {
  default = "Cloudforce"
}

variable "email" {
  default = "mufaddal.suratwala@intuitive.cloud"
}

variable "index_doc_name" {
  default = "index.html"
}