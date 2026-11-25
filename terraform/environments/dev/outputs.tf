output "documents_bucket_name" {
  description = "Bucket for knowledge-base source documents"
  value       = aws_s3_bucket.documents.id
}

output "documents_bucket_arn" {
  description = "ARN of the knowledge-base source bucket"
  value       = aws_s3_bucket.documents.arn
}

output "bedrock_kb_role_arn" {
  description = "Service role ARN for the Bedrock knowledge base"
  value       = aws_iam_role.bedrock_kb.arn
}

output "vector_bucket_name" {
  description = "S3 vector bucket for knowledge-base embeddings"
  value       = aws_s3vectors_vector_bucket.knowledge.vector_bucket_name
}

output "vector_index_arn" {
  description = "Vector index used by the knowledge base"
  value       = aws_s3vectors_index.knowledge.index_arn
}