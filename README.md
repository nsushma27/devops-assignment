# DevOps Assignment

## Overview

This project demonstrates Infrastructure as Code (IaC), containerization, CI/CD automation, and monitoring concepts using AWS, Terraform, Docker, and GitHub Actions.

The solution provisions AWS infrastructure using Terraform, containerizes a Python Flask application using Docker, and automates validation and image builds through GitHub Actions.

---

## Architecture

### Components

- AWS VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- PostgreSQL RDS Instance
- Dockerized Flask Application
- GitHub Actions CI/CD Pipeline

---

## Infrastructure Provisioning

Infrastructure is managed using Terraform.

### Resources

| Resource         | Purpose                      |
| ---------------- | ---------------------------- |
| VPC              | Isolated network environment |
| Public Subnet    | Hosts application resources  |
| Private Subnet   | Hosts database resources     |
| Internet Gateway | Internet connectivity        |
| Route Table      | Network routing              |
| Security Group   | Traffic control              |
| EC2 Instance     | Application hosting          |
| RDS PostgreSQL   | Database layer               |

Terraform files are located under:

```text
terraform/
```

---

## Application

A lightweight Flask application is used for demonstration purposes.

Endpoints:

### Home Endpoint

```http
GET /
```

Response:

```text
Hello from DevOps Assignment!
```

### Health Endpoint

```http
GET /health
```

Response:

```json
{
  "status": "healthy"
}
```

Application files are located under:

```text
app/
```

---

## Containerization

Docker is used to package the application.

### Build Image

```bash
docker build -t devops-assignment-app .
```

### Run Container

```bash
docker run -d -p 5000:5000 --name flask-app devops-assignment-app
```

---

## CI/CD Pipeline

GitHub Actions automatically executes on every push to the main branch.

Pipeline Stages:

1. Checkout Source Code
2. Setup Python Environment
3. Install Dependencies
4. Validate Python Syntax
5. Build Docker Image

Workflow location:

```text
.github/workflows/ci-cd.yml
```

---

## Monitoring Strategy

Monitoring can be implemented using AWS CloudWatch.

Recommended metrics:

- EC2 CPU Utilization
- Memory Utilization
- Disk Usage
- Application Availability
- HTTP Error Rates

Recommended dashboards:

- Infrastructure Dashboard
- Application Health Dashboard

Recommended logging:

- EC2 System Logs
- Application Logs
- Database Logs

---

## Security Considerations

- Infrastructure managed using Terraform.
- Security Groups restrict inbound access.
- Database placed in private subnet.
- AWS credentials excluded from source control.
- Terraform state files excluded from GitHub.
- Principle of least privilege should be applied to IAM roles.

---

## Repository Structure

```text
devops-assignment
│
├── app
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── terraform
│   ├── provider.tf
│   ├── vpc.tf
│   ├── network.tf
│   ├── private-subnet.tf
│   ├── rds.tf
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github
│   └── workflows
│       └── ci-cd.yml
│
└── README.md
```

---

## Future Improvements

- Multi-AZ RDS deployment
- Auto Scaling Group
- Application Load Balancer
- ECS/EKS deployment
- Prometheus and Grafana integration
- Automated deployment to AWS
