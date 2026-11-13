variable "aws_region" {
  description = "AWS Region for the Terraform state backend"
  type        = string
  default     = "eu-west-2"
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state"
  type        = string
}