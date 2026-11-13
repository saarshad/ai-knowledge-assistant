variable "aws_region" {
  description = "AWS Region for the development environment"
  type        = string
  default     = "eu-west-2"
}

variable "documents_bucket_name" {
  description = "S3 bucket containing sample knowledge-base documents"
  type        = string
  default     = "saarshad-ai-assistant-documents-dev-euw2"
}