

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_ssm_parameter" "vpc_id" {
  name = "/terraform/vpc_id"
}
data "aws_vpc" "selected" {
  id = data.aws_ssm_parameter.vpc_id.value
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.selected.id

  # use tags to filter the public subnets 
  tags = {
    "kubernetes.io/role/elb" = 1
  }
}
