AWS Infrastructure Automation with Terraform & Ansible
Project Description
This project automates the provisioning and configuration of a secure, stylish web server environment on AWS. It demonstrates the full DevOps lifecycle: using Terraform to build the cloud network and Ansible to configure the software and security layers.

Features
Infrastructure as Code (IaC): Fully automated VPC, Subnet, and Security Group creation using Terraform.

Configuration Management: Automated Nginx installation and service management using Ansible.

Security: Automatic generation of SSL certificates to support HTTPS (Port 443) traffic.

Custom Branding: A stylish, CSS-styled landing page deployed automatically to all web nodes.

Remote State: Terraform state is securely stored in an S3 backend.

Tech Stack
Cloud: AWS (EC2, VPC, S3)

Provisioning: Terraform

Configuration: Ansible

Web Server: Nginx

Operating System: Amazon Linux 2

Project Structure
modules/: Contains reusable Terraform code for EC2 and Networking.

playbook.yaml: The Ansible script for server configuration and SSL setup.

terraform.tfvars.json: Environment-specific variable definitions (Dev/Prod).

backend.tf: Configuration for the S3 remote state.

How to Deploy
Initialize Terraform:
terraform init

Deploy Infrastructure:
terraform apply

Verify Access: Access the servers via the Public IPs provided in the Terraform output using https:// if prod or http if dev.
![Web Server Output](./Screenshot%202026-01-20%20104119.png)

terraform apply
Verify Access: Access the servers via the Public IPs provided in the Terraform output using https://.
