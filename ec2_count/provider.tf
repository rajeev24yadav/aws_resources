terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAWTWA2GYUJZLRTHW2"
  secret_key = "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"
}