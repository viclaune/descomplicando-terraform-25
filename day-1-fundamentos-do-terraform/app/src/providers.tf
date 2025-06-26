terraform {
    required_providers {
      aws = {
        source="hashicorp/aws"
        version="~>5.0"
      }
    }

    backend "s3" {
      bucket = "mybucket-test"
      key="path/to/my/bucket"
      region="us-east-1"
    }
}

provider "aws" {
  region="us-east-1"
}