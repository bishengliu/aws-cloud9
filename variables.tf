variable "environment" {
  description = "Environment name (dev/test/loadtest/staging/preprod/prod)"
  type        = string
  default     = "personal"
}

variable "system" {
  description = "Name of the system or environment where these resources are deployed."
  type        = string
  default     = "search"
}

variable "project" {
  description = "The internal name of the project to which these resources belong."
  type        = string
  default     = "yeti"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
