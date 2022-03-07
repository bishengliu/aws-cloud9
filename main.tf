terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.69"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


resource "random_string" "random" {
  length  = 16
  special = false
}

resource "aws_cloud9_environment_ec2" "cloud9" {
  name                        = "cloud9-${var.project}-${var.system}-${var.environment}-${random_string.random.result}"
  instance_type               = var.instance_type
  subnet_id                   = tolist(data.aws_subnet_ids.public_subnets.ids)[0]
  automatic_stop_time_minutes = 30

  description = "${var.project}-${var.system}-${var.environment}-cloud9"
  tags        = local.common_tags
}

locals {
  common_tags = {
    Project     = var.project
    System      = var.system
    Environment = var.environment
    IaC         = "hands"
  }
}
