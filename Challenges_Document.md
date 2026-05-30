# DevOps Assignment - Challenges and Resolutions

## Challenge 1: Terraform Infrastructure Design

### Problem

Designing the AWS infrastructure while ensuring proper network segregation between application and database resources.

### Resolution

Implemented a VPC with separate public and private subnets. The application resources were designed to reside in the public subnet while the PostgreSQL RDS instance was placed in a private subnet to improve security and follow cloud architecture best practices.

---

## Challenge 2: Docker Environment Setup

### Problem

Docker was initially not installed and configured on the local machine, preventing container image creation and testing.

### Resolution

Installed Docker Desktop, verified the installation using the hello-world container, and successfully built and ran the application container locally.

---

## Challenge 3: Application Enhancement

### Problem

The initial application was a basic Flask service and did not sufficiently demonstrate operational use cases relevant to a DevOps/SRE environment.

### Resolution

Enhanced the application into an SRE Incident Management API with endpoints for incident tracking, health checks, and operational statistics.

---

## Challenge 4: GitHub Actions Workflow Configuration

### Problem

The GitHub Actions workflow failed due to YAML syntax issues and incorrect file content placement.

### Resolution

Corrected YAML indentation, fixed workflow syntax errors, and ensured the CI/CD pipeline successfully performed Terraform validation, Python validation, and Docker image builds.

---

## Challenge 5: Terraform Validation Failure

### Problem

Terraform validation failed because GitHub Actions workflow content was accidentally copied into the monitoring.tf file.

### Resolution

Restored the CloudWatch monitoring configuration in monitoring.tf and revalidated the Terraform configuration successfully.

---

## Challenge 6: Monitoring Implementation

### Problem

Defining monitoring resources that aligned with the project requirements while keeping the implementation lightweight.

### Resolution

Implemented CloudWatch Log Groups and dashboards to provide centralized logging and infrastructure/application monitoring capabilities.

---

## Key Learnings

- Importance of Infrastructure as Code validation.
- Benefits of containerization for consistent deployments.
- CI/CD pipeline troubleshooting and validation.
- AWS networking and security best practices.
- Monitoring and observability fundamentals using CloudWatch.

## Conclusion

The project successfully demonstrated infrastructure provisioning, deployment automation, monitoring, logging, and application containerization using industry-standard DevOps tools and practices.
