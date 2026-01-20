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
.
├── modules/                # Reusable Terraform modules (Networking & EC2)
├── playbook.yaml           # Ansible playbook for Nginx & SSL setup
├── terraform.tfvars.json   # Environment variables (Dev/Prod)
├── backend.tf              # S3 Remote State configuration
├── main.tf                 # Primary Terraform execution file
└── outputs.tf              # Infrastructure output definitions

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
