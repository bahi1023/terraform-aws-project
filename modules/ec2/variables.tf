variable "subnet_id" {
  description = "The Subnet ID where the instance will be deployed"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string  
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
 
}

variable "security_group_id" {
  description = "The Security Group ID to attach to the instance"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
  default     = {}
} 

variable "key_name" {
  description = "The name of the SSH key pair to use for the instance"
  type        = string
}
variable "private_key_pem" {
  type      = string
  sensitive = true
}
variable "private_key_path" {
  description = "The path to the private key file on the local machine"
  type        = string
}