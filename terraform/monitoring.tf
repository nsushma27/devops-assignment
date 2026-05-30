name: DevOps Assignment CI/CD

on:
  push:
    branches:
      - main
      - develop

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install Dependencies
        run: |
          cd app
          pip install -r requirements.txt

      - name: Verify Python Syntax
        run: |
          python -m py_compile app/app.py

      - name: Build Docker Image
        run: |
          docker build -t devops-assignment-app ./app

  deploy-staging:
    if: github.ref == 'refs/heads/develop'

    needs: build-and-test

    runs-on: ubuntu-latest

    steps:
      - name: Deploy to Staging
        run: |
          echo "Deploying application to STAGING environment"

  deploy-production:
    if: github.ref == 'refs/heads/main'

    needs: build-and-test

    runs-on: ubuntu-latest

    steps:
      - name: Deploy to Production
        run: |
          echo "Deploying application to PRODUCTION environment"