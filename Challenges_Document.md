# Challenges Faced and Resolutions

## Challenge 1: AWS CLI Authentication

### Problem

Initially, AWS CLI commands returned root account details instead of the intended IAM user.

### Resolution

Verified AWS CLI configuration and ensured Terraform was configured with the correct IAM credentials.

---

## Challenge 2: Terraform Installation

### Problem

Terraform executable was downloaded but was not recognized by the command prompt.

### Resolution

Added the Terraform installation directory to the Windows PATH environment variable and verified installation using:

terraform version

---

## Challenge 3: Terraform Directory Structure

### Problem

Terraform commands failed because they were executed from the wrong directory.

### Resolution

Organized Terraform files into a dedicated terraform directory and ran commands from the correct location.

---

## Challenge 4: Docker Installation

### Problem

Docker commands were unavailable initially.

### Resolution

Installed Docker Desktop and verified successful installation using:

docker --version

---

## Challenge 5: Docker Build Failure

### Problem

Docker build failed because the Dockerfile could not be located.

### Resolution

Verified the application directory structure and executed docker build from the app directory.

---

## Challenge 6: Container Name Conflict

### Problem

Docker reported that the container name was already in use.

### Resolution

Verified existing containers using docker ps and reused the running container.

---

## Challenge 7: Git Configuration

### Problem

Git commit failed because user identity was not configured.

### Resolution

Configured Git username and email using Git configuration commands.

---

## Challenge 8: CI/CD Validation

### Problem

Needed to ensure the GitHub Actions workflow correctly validated the application.

### Resolution

Implemented a CI pipeline that validates Python syntax and builds the Docker image automatically on every push.
