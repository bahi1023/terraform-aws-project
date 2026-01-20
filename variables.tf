variable "region" {
  description = "The AWS region to deploy resources"
  type = string 
}
variable "access_key" {
  description = "the access key of the account"
  type = string
}
variable "secret_key" {
  description = "the secret access key of the account"
  type = string
}
variable "vpc_cidr" {
  description = "CIDR block for the manual VPC (Must match what you created in AWS)"
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnet_cidr" {
  description = "CIDR block for the new Subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "environment" {
  description = "Deployment Environment (prod or non-prod)"
  type        = string

}
variable "instance_type_map" {
  description = "Map of environment to instance type"
  type        = map(string)
}
variable "project_name" {
  type = string
}
variable "owner" {
  type = string
}
