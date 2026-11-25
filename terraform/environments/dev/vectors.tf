resource "aws_s3vectors_vector_bucket" "knowledge" {
  vector_bucket_name = "saarshad-ai-assistant-vectors-dev-euw2"
}

resource "aws_s3vectors_index" "knowledge" {
  vector_bucket_name = aws_s3vectors_vector_bucket.knowledge.vector_bucket_name
  index_name         = "knowledge-documents"

  data_type       = "float32"
  dimension       = 1024
  distance_metric = "cosine"

  metadata_configuration {
    non_filterable_metadata_keys = [
      "AMAZON_BEDROCK_TEXT",
      "AMAZON_BEDROCK_METADATA"
    ]
  }
}

resource "aws_iam_role_policy" "bedrock_kb_vectors" {
  name = "knowledge-base-vector-index"
  role = aws_iam_role.bedrock_kb.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "UseKnowledgeVectorIndex"
        Effect = "Allow"

        Action = [
          "s3vectors:GetIndex",
          "s3vectors:PutVectors",
          "s3vectors:GetVectors",
          "s3vectors:DeleteVectors",
          "s3vectors:QueryVectors"
        ]

        Resource = aws_s3vectors_index.knowledge.index_arn
      }
    ]
  })
}