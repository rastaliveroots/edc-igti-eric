provider "aws" {
  region = var.aws_region
}

#centralizar o arquivo de controlo do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igit-eric"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}
#teste eric