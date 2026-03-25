# 🚀 Containerized App Deployment with Docker & Terraform

**End-to-end deployment of a multi-tier containerized application using Docker, Docker Compose, and Terraform with CI/CD automation.**

## 📖 Overview

This repository demonstrates a complete DevOps workflow for building, containerizing, and deploying an application using modern tools and practices. It showcases how Docker is used to package applications, Docker Compose manages multi-container environments, and Terraform provisions cloud infrastructure.

The project highlights how Infrastructure as Code (IaC) combined with containerization enables scalable, repeatable, and efficient deployments.

## ✨ Features

-   **Multi-Tier Containerized Application**
-   **Docker Compose Integration**
-   **Infrastructure as Code (IaC) with Terraform**
-   **CI/CD Automation using GitHub Actions**
-   **AWS Cloud Deployment Ready**
-   **Scalable & Modular Architecture**

## 🛠️ Tech Stack

**Containerization:**

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

![Docker Compose](https://img.shields.io/badge/Docker_Compose-384D54?style=for-the-badge&logo=docker&logoColor=white)

**Infrastructure as Code:**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

**Cloud Provider:**

![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)

**CI/CD:**

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

---

## 🚀 Quick Start

### Prerequisites

- Git  
- Docker  
- Docker Compose  
- Terraform  
- AWS CLI (configured)

### Clone Repo

```bash
git clone https://github.com/hs2002-18/Containerized-App-Deployment-using-Docker-Terraform.git
cd Containerized-App-Deployment-using-Docker-Terraform
```

---

## 📁 Project Structure (Complete Architecture)

```
Containerized-App-Deployment-using-Docker-Terraform/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml              # GitHub Actions pipeline
│
├── app/
│   ├── backend/
│   │   ├── Dockerfile            # Backend container config
│   │   ├── package.json          # Node dependencies
│   │   ├── package-lock.json     # Dependency lock file
│   │   └── index.js              # Backend entry point
│   │
│   └── frontend/
│       ├── Dockerfile            # Frontend container config
│       ├── package.json          # Frontend dependencies
│       ├── package-lock.json
│       └── index.js / src/       # Frontend source
│
├── terraform/
│   ├── main.tf                   # Core infrastructure
│   ├── variables.tf              # Input variables
│   ├── outputs.tf                # Outputs (IP, URL, etc.)
│   ├── provider.tf               # Provider configuration
│   └── terraform.tfvars          # Variable values (optional)
│
├── docker-compose.yml            # Multi-container setup
├── deploy.sh                     # Deployment automation script
├── .gitignore                    # Git ignored files
└── README.md                     # Project documentation
```

---

## 🐳 Docker Usage

### Build Images

```bash
docker build -t backend ./app/backend
docker build -t frontend ./app/frontend
```

### Run Containers

```bash
docker-compose up -d
```

### Stop Containers

```bash
docker-compose down
```

---

## 🌍 Terraform Deployment

```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

### Destroy Resources

```bash
terraform destroy -auto-approve
```

---

## 🔄 CI/CD Pipeline

Automated using GitHub Actions:

- Build Docker images  
- Push to registry  
- Deploy using Terraform  

---

## ⚙️ Configuration

### Environment Variables

| Variable | Description | Required |
|----------|------------|----------|
| AWS_ACCESS_KEY_ID | AWS Access Key | Yes |
| AWS_SECRET_ACCESS_KEY | AWS Secret Key | Yes |
| AWS_REGION | Deployment Region | Yes |

---

## 🔮 Future Developments

- Kubernetes deployment  
- Monitoring (Prometheus + Grafana)  
- Logging (ELK Stack)  
- Auto-scaling & Load Balancing  
- Multi-environment support  

---

## 📄 Author

**Harsh Shrimali**

---
