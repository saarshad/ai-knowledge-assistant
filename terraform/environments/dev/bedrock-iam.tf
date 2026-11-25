data "aws_caller_identity" "current" {}

locals {
  kb_role_name = "ai-assistant-dev-bedrock-kb"

  embedding_model_arn = join("", [
    "arn:aws:bedrock:",
    var.aws_region,
    "::foundation-model/amazon.titan-embed-text-v2:0"
  ])
}

resource "aws_iam_role" "bedrock_kb" {
  name        = local.kb_role_name
  description = "Service role for the learning Bedrock knowledge base"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "bedrock.amazonaws.com"
        }

        Action = "sts:AssumeRole"

        Condition = {
          StringEquals = {
            "aws:SourceAccount" = data.aws_caller_identity.current.account_id
          }

          ArnLike = {
            "aws:SourceArn" = join("", [
              "arn:aws:bedrock:",
              var.aws_region,
              ":",
              data.aws_caller_identity.current.account_id,
              ":knowledge-base/*"
            ])
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "bedrock_kb" {
  name = "knowledge-base-source-and-embedding"
  role = aws_iam_role.bedrock_kb.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ListDocumentBucket"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = aws_s3_bucket.documents.arn
      },
      {
        Sid      = "ReadSourceDocuments"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.documents.arn}/documents/*"
      },
      {
        Sid      = "InvokeEmbeddingModel"
        Effect   = "Allow"
        Action   = ["bedrock:InvokeModel"]
        Resource = local.embedding_model_arn
      }
    ]
  })
}