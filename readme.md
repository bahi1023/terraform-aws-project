# 🚀 AWS Infrastructure Automation

### *Terraform & Ansible Orchestration*

!
This repository demonstrates a complete DevOps lifecycle by automating the provisioning and configuration of a secure, high-performance web server environment on AWS. It leverages **Infrastructure as Code (IaC)** for resource management and **Configuration Management** for consistent software deployment.

---

## 🏗️ Architecture & Features

* **Infrastructure as Code (IaC):** Fully automated VPC, Subnet, and Security Group creation.
* **Configuration Management:** Automated Nginx installation and lifecycle management.
* **Hardened Security:** * Automated **SSL certificate generation** for HTTPS (Port 443).
* Strict Security Group rules for least-privilege access.


* **Remote State Management:** Terraform state is securely persisted in an **S3 backend** to prevent state drift and enable collaboration.
* **Custom Branding:** Automatically deploys a modern, CSS-styled landing page to all provisioned web nodes.

---

## 🛠️ Tech Stack

| Category | Tool |
| --- | --- |
| **Cloud Provider** | AWS (EC2, VPC, S3) |
| **Provisioning** | Terraform |
| **Configuration** | Ansible |
| **Web Server** | Nginx |
| **Operating System** | Amazon Linux 2 |

---

## 📂 Project Structure

```bash
DAY3_LAB1/
├── modules/
│   ├── ec2/
│   │   ├── data.tf            # Fetching AMIs and existing resources
│   │   ├── main.tf            # EC2 instance and Security Group logic
│   │   ├── outputs.tf         # EC2 specific outputs (e.g., Public IP)
│   │   └── variables.tf       # Input variables for EC2 module
│   └── subnet/
│       ├── main.tf            # Subnet and Networking resource logic
│       ├── outputs.tf         # Subnet IDs for EC2 placement
│       └── variables.tf       # CIDR blocks and VPC references
├── backend.tf                 # S3 Remote State & DynamoDB locking config
├── locals.tf                  # Local values for common naming/tagging
├── main.tf                    # Root configuration calling the modules
├── module.tf                  # Module instantiation (EC2 & Subnet)
├── outputs.tf                 # Final infrastructure output definitions
├── providers.tf               # AWS Provider and Version constraints
├── variables.tf               # Global input variable definitions
├── terraform.tfvars.json      # Environment-specific variable values
├── playbook.yaml              # Ansible playbook for Nginx & SSL setup
├── my-terraform-key.pem       # SSH Private Key (Ensure this is in .gitignore!)
└── .terraform.lock.hcl        # Provider dependency lock file

```

---

## 🚀 How to Deploy

Follow these steps to initialize and launch your automated environment:

### 1. Initialize Infrastructure

Prepare the working directory and connect to the S3 remote backend.

terraform init

### 2. Deploy to AWS

Review the execution plan and apply the changes.

terraform apply -auto-approve

### 3. Verify Access

Once the deployment is complete, Terraform will output the **Public IPs** of your instances.

* **Production:** Access via `https://<PUBLIC_IP>`
* **Development:** Access via `http://<PUBLIC_IP>`

---

## 🔐 Security Note

The security groups are pre-configured to allow:

* **SSH (22):** For administrative access.
* **HTTP (80):** For initial web requests and redirects.
* **HTTPS (443):** For secure, encrypted traffic.

---


**Developed by Bahi** *Automating the cloud, one module at a time.*
![Infrastructure Screenshot](https://raw.githubusercontent.com/bahi1023/terraform-aws-project/main/Screenshot%202026-01-20%20104119.png)
