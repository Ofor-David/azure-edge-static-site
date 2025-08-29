# Azure Frontend Deployment

This project demonstrates deploying a modern static frontend application to Azure using infrastructure-as-code (IaC) with Terraform. The main focus is on cloud deployment, automation.

## Project Structure

- **/app/**: Frontend application (Vite + React + Tailwind CSS)
- **/terraform/**: Infrastructure-as-code for Azure resources
- **/.github/workflows/**: GitHub Actions for CI/CD automation

## Cloud Architecture Overview

- **Azure Storage Account (Static Website Hosting)**: Hosts the static frontend files.
- **Terraform**: Manages and provisions all Azure resources.
- **GitHub Actions**: Automates build and deployment to Azure on every push.

## Requirements

- **Azure Subscription**
- **Terraform**
- **Azure CLI** (for authentication)
- **GitHub account** (for CI/CD)

## Setup & Deployment

### 1. Clone the Repository

```sh
git clone git@github.com:Ofor-David/azure-frontend-deployment.git
cd azure-frontend-deployment
```

### 2. Configure Azure Credentials
Install Azure CLI
```sh
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

Login to Azure and set the correct subscription:
```sh
az login
```

### 3. Infrastructure Provisioning (Terraform)

```sh
cd terraform
```
Rename the `terraform_tfvars` to `terraform.tfvars` and replace the placeholder variables.

```sh
terraform init
terraform plan
terraform apply
```

This will create the required Azure resources

## Repo Setup
Create a new github repo and add 2 repo secrets:
- **AZURE_STORAGE_ACCOUNT:** Get from output after running terraform apply
- **AZURE_STORAGE_KEY:** Get from your azure storage account

## CI/CD Automation

- The `.github/workflows/deploy.yaml` workflow builds the frontend and deploys it to Azure Storage automatically.
- Ensure your repository secrets are set for Azure authentication (see workflow file for details).

## How It Works

1. **Infrastructure**: Terraform scripts in `/terraform` define and provision all Azure resources needed for static site hosting.
2. **Frontend Build**: The app in `/app` is built with Vite, producing static assets.
3. **Deployment**: Static files are uploaded to Azure Storage.
4. **Automation**: GitHub Actions handles build and deployment on every code push.
