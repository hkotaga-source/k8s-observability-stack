# Optional: Basic EKS cluster with Terraform
# Uncomment and fill in your values if you want to provision from scratch

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "sre-observability-demo"
}

# Example: You can expand this with module "eks" from terraform-aws-modules
# For production, use the official EKS module.

output "note" {
  value = "This is a placeholder. Use terraform-aws-modules/eks for a real cluster."
}
