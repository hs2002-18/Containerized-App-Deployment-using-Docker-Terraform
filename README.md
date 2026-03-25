# 🚀 Containerized App Deployment with Docker & Terraform

**End-to-end deployment of a containerized application to AWS using Docker for containerization and Terraform for infrastructure as code.**

## 📖 Overview

This repository demonstrates a comprehensive approach to deploying a containerized application leveraging modern DevOps practices. It provides a structured example for taking an application, containerizing it with Docker, and then provisioning the necessary cloud infrastructure on Amazon Web Services (AWS) using Terraform. The project highlights the benefits of Infrastructure as Code (IaC) for repeatable, scalable, and manageable deployments.

The primary goal is to illustrate how Docker and Terraform can work together to create a robust deployment pipeline for any web application or service.

## ✨ Features

-   **Containerized Application Deployment**: Easily package and run applications using Docker.
-   **Infrastructure as Code (IaC)**: Define and provision AWS resources programmatically using Terraform.
-   **AWS Cloud Integration**: Deploy resources on AWS, including (but not limited to) EC2 instances, Security Groups, and VPC configurations.
-   **Automated Deployment Script**: A `deploy.sh` script to streamline the build and deployment process.
-   **Reproducible Environments**: Ensure consistent infrastructure setups across different environments.
-   **GitHub Actions Integration (Potential)**: `.github` directory suggests potential for CI/CD pipeline automation.

## 🛠️ Tech Stack

**Containerization:**

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

**Infrastructure as Code:**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

**Cloud Provider:**

![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)

**Scripting & Automation:**

![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

## 🚀 Quick Start

Follow these steps to deploy the containerized application to your AWS environment.

### Prerequisites

Before you begin, ensure you have the following tools installed:

-   **Git**: For cloning the repository.
-   **Docker**: For building and managing container images.
-   **Terraform**: For provisioning and managing AWS infrastructure.
-   **AWS CLI**: Configured with credentials that have sufficient permissions to create AWS resources (e.g., EC2, VPC, Security Groups).

### Installation & Setup

1.  **Clone the repository**
    ```bash
    git clone https://github.com/hs2002-18/Containerized-App-Deployment-using-Docker-Terraform.git
    cd Containerized-App-Deployment-using-Docker-Terraform
    ```

2.  **Configure AWS Credentials**
    Ensure your AWS CLI is configured. You can set up your credentials using `aws configure` or by setting environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`).

    ```bash
    # Example for setting environment variables (replace with your actual keys)
    export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
    export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
    export AWS_REGION="us-east-1" # Or your desired AWS region
    ```

### Deployment

The deployment process is orchestrated by the `deploy.sh` script, which handles building the Docker image and applying the Terraform configuration.

1.  **Execute the deployment script**
    ```bash
    chmod +x deploy.sh # Make the script executable
    ./deploy.sh
    ```

    The script will perform the following actions:
    *   Build the Docker image for the application located in the `app/` directory.
    *   Initialize Terraform in the `terraform/` directory.
    *   Apply the Terraform configuration to provision AWS resources. This will typically create an EC2 instance, network configurations, and deploy the application.

2.  **Verify Deployment**
    After the script completes, Terraform will output relevant information. Look for outputs like public IP addresses or DNS names of the deployed resources to access your application.

    You can also verify resource creation in the AWS Management Console.

## 📁 Project Structure

```
Containerized-App-Deployment-using-Docker-Terraform/
├── .github/              # Contains GitHub Actions workflows for CI/CD
│   └── workflows/        # Action definitions (TODO: Add specific workflow files if present)
├── .gitignore            # Specifies files/directories to be ignored by Git
├── app/                  # The example application to be containerized
│   ├── Dockerfile        # Defines how the application is built into a Docker image
│   ├── index.js          # (Example: Main entry point for a Node.js application)
│   └── package.json      # (Example: Node.js package definition and dependencies)
├── aws/                  # Directory for additional AWS-specific configurations or scripts (currently empty)
├── deploy.sh             # Shell script to orchestrate the Docker build and Terraform deployment
└── terraform/            # Terraform configurations for provisioning AWS infrastructure
    ├── main.tf           # Defines AWS resources (VPC, EC2, Security Groups, etc.)
    ├── variables.tf      # Declares input variables for customizing the infrastructure
    ├── outputs.tf        # Defines output values (e.g., public IP) after infrastructure creation
    └── versions.tf       # Specifies required Terraform providers and their versions
```

## ⚙️ Configuration

### Environment Variables

The deployment process relies on environment variables for AWS authentication.

| Variable              | Description                                       | Required |

| :-------------------- | :------------------------------------------------ | :------- |

| `AWS_ACCESS_KEY_ID`   | Your AWS access key ID.                           | Yes      |

| `AWS_SECRET_ACCESS_KEY` | Your AWS secret access key.                       | Yes      |

| `AWS_REGION`          | The AWS region where resources will be provisioned. | Yes      |

### Terraform Variables

The `terraform/variables.tf` file defines input variables that can customize the AWS infrastructure. You can set these variables via a `terraform.tfvars` file, command-line arguments, or environment variables prefixed with `TF_VAR_`.

Common variables might include:
- `aws_region`: The AWS region for deployment (often set via `AWS_REGION` env var).
- `instance_type`: The EC2 instance type (e.g., `t2.micro`).
- `ami_id`: The Amazon Machine Image ID for the EC2 instance.
- `app_port`: The port on which the containerized application listens.

## 🚀 Deployment

The `deploy.sh` script automates the core deployment steps. For more granular control or debugging, you can execute the commands manually:

1.  **Build Docker Image:**
    ```bash
    docker build -t containerized-app ./app
    ```
    This command builds a Docker image named `containerized-app` from the `Dockerfile` located in the `app/` directory.

2.  **Initialize Terraform:**
    ```bash
    cd terraform
    terraform init
    ```
    This command initializes the Terraform working directory, downloading necessary providers (e.g., AWS provider).

3.  **Review Terraform Plan (Optional but Recommended):**
    ```bash
    terraform plan
    ```
    This command shows you what actions Terraform will take to achieve the desired state defined in your `.tf` files, without actually making any changes.

4.  **Apply Terraform Configuration:**
    ```bash
    terraform apply -auto-approve
    ```
    This command applies the Terraform configuration, provisioning or updating the AWS resources. The `-auto-approve` flag bypasses the interactive confirmation prompt.

5.  **Clean Up (Destroy Infrastructure):**
    To tear down all provisioned AWS resources, use:
    ```bash
    terraform destroy -auto-approve
    ```
    **Use with caution**: This will permanently delete all resources created by Terraform.

## 🔮 Future Developments

Contributions are welcome! If you have suggestions for improving this deployment example, please feel free to:

1.  FMulti‑Environment Support.
2.  Container Orchestration.
3.  Monitoring & Logging.
4.  Scaling & Load Balancing

## 📄 Author
Harsh Shrimali
---
