# DevOps Assignment

## Overview

This project demonstrates Infrastructure as Code (IaC), containerization, CI/CD automation, monitoring, and operational service management using AWS, Terraform, Docker, and GitHub Actions.

The solution provisions AWS infrastructure using Terraform, deploys a containerized SRE Incident Management API using Docker, automates validation and deployment workflows through GitHub Actions, and implements monitoring using CloudWatch dashboards and log groups.

The Incident Management API simulates operational incident tracking for microservices and exposes health, incident management, and operational statistics endpoints.

---

# Architecture

## Components

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
- CloudWatch Log Group
- CloudWatch Dashboards

---

# Solution Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions CI/CD
    │
    ├── Code Validation
    ├── Docker Build
    ├── Staging Deployment Logic
    └── Production Deployment Logic
    │
    ▼
AWS Infrastructure (Terraform)

VPC
├── Public Subnet
│   └── EC2 Instance
│       └── SRE Incident Management API
│
└── Private Subnet
    └── PostgreSQL RDS

CloudWatch
├── Infrastructure Dashboard
├── Application Dashboard
└── Centralized Logging
```

---

# Infrastructure Provisioning

Infrastructure is managed using Terraform.

## Resources

| Resource              | Purpose                                   |
| --------------------- | ----------------------------------------- |
| VPC                   | Isolated network environment              |
| Public Subnet         | Hosts application resources               |
| Private Subnet        | Hosts database resources                  |
| Internet Gateway      | Internet connectivity                     |
| Route Table           | Network routing                           |
| Security Group        | Traffic control                           |
| EC2 Instance          | Application hosting                       |
| PostgreSQL RDS        | Database layer                            |
| CloudWatch Log Group  | Centralized logging                       |
| CloudWatch Dashboards | Infrastructure and application monitoring |

Terraform files are located under:

```text
terraform/
```

---

# Application

The application is a lightweight SRE Incident Management API built using Flask.

The API simulates operational incident tracking for services running in a distributed environment.

## Features

- Incident Tracking
- Service Health Checks
- Operational Statistics
- REST API Endpoints

## Sample Incident

```json
{
  "id": 1,
  "service_name": "payment-service",
  "severity": "high",
  "status": "open"
}
```

## Endpoints

### Application Information

```http
GET /
```

Example Response:

```json
{
  "application": "SRE Incident Management API",
  "version": "1.0",
  "status": "running"
}
```

---

### Health Check

```http
GET /health
```

Example Response:

```json
{
  "status": "healthy"
}
```

---

### List Incidents

```http
GET /incidents
```

---

### Create Incident

```http
POST /incidents
```

Example Request:

```json
{
  "service_name": "checkout-service",
  "severity": "critical"
}
```

---

### Get Incident By ID

```http
GET /incidents/<id>
```

---

### Operational Statistics

```http
GET /stats
```

Example Response:

```json
{
  "total_incidents": 2,
  "open_incidents": 1,
  "investigating_incidents": 1,
  "resolved_incidents": 0
}
```

Application files are located under:

```text
app/
```

---

# Containerization

Docker is used to package the application into a portable container image.

## Build Docker Image

```bash
docker build -t devops-assignment-app .
```

## Run Container

```bash
docker run -d -p 5000:5000 --name flask-app devops-assignment-app
```

---

# CI/CD Pipeline

GitHub Actions automatically executes on code pushes.

## Pipeline Stages

1. Checkout Source Code
2. Setup Python Environment
3. Install Dependencies
4. Validate Python Syntax
5. Build Docker Image
6. Staging Deployment Logic
7. Production Deployment Logic

Workflow location:

```text
.github/workflows/ci-cd.yml
```

## Deployment Strategy

### Staging

```text
develop branch
```

Deploys to the staging environment.

### Production

```text
main branch
```

Deploys to the production environment.

---

# Monitoring and Logging

Monitoring is implemented using AWS CloudWatch resources.

## Centralized Logging

CloudWatch Log Group:

```text
/devops-assignment/application
```

## Dashboards

### Infrastructure Dashboard

Monitors:

- EC2 CPU Utilization
- Resource Performance
- Infrastructure Health

### Application Dashboard

Monitors:

- Application Request Metrics
- Operational Statistics
- Service Health Indicators

---

# Security Considerations

- Infrastructure managed through Terraform.
- Security Groups restrict inbound access.
- PostgreSQL RDS deployed within a private subnet.
- AWS credentials excluded from source control.
- Terraform state files excluded from GitHub.
- Principle of Least Privilege recommended for IAM access.
- Sensitive configuration values should be externalized using secrets management solutions.

---

# Repository Structure

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
│   ├── monitoring.tf
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github
│   └── workflows
│       └── ci-cd.yml
│
├── Challenges_Document.md
│
└── README.md
```

---

# Challenges Faced

Major challenges encountered during implementation are documented in:

```text
Challenges_Document.md
```

---

# Future Improvements

- Multi-AZ PostgreSQL Deployment
- Terraform Remote State (S3 + DynamoDB)
- Application Load Balancer
- Auto Scaling Group
- ECS/EKS Deployment
- AWS Secrets Manager Integration
- CloudWatch Alarms and Notifications
- Prometheus and Grafana Integration
- PostgreSQL-backed Incident Persistence
- Blue/Green Deployment Strategy

---

# Conclusion

This project demonstrates a complete DevOps workflow including infrastructure provisioning, containerization, CI/CD automation, monitoring, logging, and operational service management using industry-standard tools and practices.
