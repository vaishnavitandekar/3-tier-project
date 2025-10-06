# 🚀 3-Tier AWS Infrastructure with Terraform

This repository contains Terraform code to provision a **3-Tier AWS architecture**.
It demonstrates how to build a **scalable, secure, and production-ready cloud infrastructure** with separation of concerns across **Web Tier, Application Tier, and Database Tier**.

---

## 🏗️ Architecture

The infrastructure is designed using a **3-tier architecture model**:

1. **Web Tier** 🌐

   * Public Subnets
   * Auto Scaling Group for Web Servers (`webasg.tf`)
   * Application Load Balancer (ALB)
   * Apache installed via `apache.sh`

2. **Application Tier** ⚙️

   * Private Subnets
   * Auto Scaling Group for Application Servers (`appasg.tf`)
   * Internal Load Balancer (`applb.tf`)

3. **Database Tier** 💾

   * RDS instance in private subnets (`db.tf`)
   * Accessible only from the Application Tier via Security Groups

4. **Networking & Security** 🔒

   * VPC (`vpc.tf`)
   * Public & Private Subnets (`subnet.tf`)
   * Internet Gateway (`igw.tf`)
   * NAT Gateway (`nat.tf`)
   * Route Tables (`rtb.tf`)
   * Security Groups (`sg.tf`)
   * IAM Roles & Policies (`iam.tf`)

5. **Storage** 📦

   * S3 bucket for object storage (`s3.tf`)

---

## ⚙️ Tech Stack

* **Terraform** (Infrastructure as Code)
* **AWS Services** – EC2, VPC, Subnets, ALB, ASG, RDS, S3, IAM, NAT, IGW, SG
* **Bash Script** – Apache installation (`apache.sh`)

---

## 📂 Repository Structure

```
.
├── apache.sh          # Installs Apache on EC2
├── appasg.tf          # App tier Auto Scaling Group
├── applb.tf           # Application Load Balancer for App tier
├── db.tf              # RDS Database setup
├── iam.tf             # IAM roles and policies
├── igw.tf             # Internet Gateway
├── keypair.tf         # EC2 Key Pair
├── nat.tf             # NAT Gateway
├── outputs.tf         # Terraform Outputs
├── provider.tf        # AWS Provider config
├── rtb.tf             # Route Tables
├── s3.tf              # S3 Bucket
├── sg.tf              # Security Groups
├── subnet.tf          # Subnet configuration
├── vpc.tf             # VPC setup
├── webasg.tf          # Web tier Auto Scaling Group
```

---

## 🚀 How to Deploy

### Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.5+)
* AWS CLI configured (`aws configure`)
* IAM user with Administrator/PowerUser permissions
* SSH key pair created in AWS (update `keypair.tf` with your key name)

### Steps

1. Clone this repository

   ```bash
   git clone https://github.com/vaishnavitandekar/3-tier-project.git
   cd 3-tier-project
   ```

2. Initialize Terraform

   ```bash
   terraform init
   ```

3. Review the plan

   ```bash
   terraform plan
   ```

4. Apply to create infrastructure

   ```bash
   terraform apply -auto-approve
   ```

5. Destroy when not needed

   ```bash
   terraform destroy -auto-approve
   ```

---

## 📊 Outputs

After deployment, Terraform will provide:

* ✅ **ALB DNS Name** – Public URL to access web tier
* ✅ **RDS Endpoint** – Database connection string
* ✅ **S3 Bucket Name** – For storage

---

## 📫 Connect with Me

<p align="center">
  <a href="https://www.linkedin.com/in/vaishnavi-tandekar-devops/" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg" width="30" alt="LinkedIn" />
  </a>
  &nbsp;&nbsp;
<a href="mailto:vaishnavitandekar.devops@gmail.com" target="_blank">
  <img src="https://cdn.simpleicons.org/gmail/EA4335" width="30" />
</a>
 &nbsp;&nbsp;
<a href="https://hashnode.com/@VaishnaviTandekar" target="_blank">
  <img src="https://cdn.simpleicons.org/hashnode/FF5722" width="30" />
</a>
