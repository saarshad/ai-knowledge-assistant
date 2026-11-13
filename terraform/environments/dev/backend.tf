terraform {
  backend "s3" {
    bucket       = "saarshad-ai-assistant-tfstate-euw2"
    key          = "ai-assistant/dev/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}