variable "AWS_ACCESS_KEY_ID" {
  description = "Database administrator username"
  type        = string
  sensitive   = true

}
variable "AWS_SECRET_ACCESS_KEY" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}
variable "UFOST_AWS_ACCESS_KEY_ID" {
  description = "Database administrator username"
  type        = string
  sensitive   = true

}
variable "UFOST_AWS_ACCESS_KEY" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}
variable "aws_region" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
  default = "us-east-2"
}
variable "instance_name" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}
variable "vpc_id" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}
variable "vpc_cidr_block" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}
variable "key_name" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
  default = "sandboxkeyreg2"
}
