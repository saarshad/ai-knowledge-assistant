output "documents_bucket_name" {
  description = "Bucket for knowledge-base source documents"
  value       = aws_s3_bucket.documents.id
}

output "documents_bucket_arn" {
  description = "ARN of the knowledge-base source bucket"
  value       = aws_s3_bucket.documents.arn
}