# App: deltavids 

## Table of Contents 📚
- [App: deltavids](#app-deltavids)
  - [Table of Contents 📚](#table-of-contents-)
  - [🎥Live Demonstration](#live-demonstration)
  - [Local Setup Vite](#local-setup-vite)
  - [Local Setup Packer](#local-setup-packer)
  - [Secure Multi-Stage Docker](#secure-multi-stage-docker)
  - [Terraform Structure](#terraform-structure)
  - [Modules](#modules)
  - [Environments](#environments)
  - [Backend](#backend)
  - [Usage](#usage)
  - [Vault Server](#vault-server)
  - [Deployment Workflow](#deployment-workflow)
  - [AWS Services Used](#aws-services-used)
  - [Architecture Diagram](#architecture-diagram)
---


## 🎥Live Demonstration

<div style="text-align: center; margin: 20px 0;">
  <h3>Prod:</h3>
  <div style="width: 400px; margin: 0 auto; border-radius: 10px;overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <img src="https://github.com/YacqubAdan/delta-ecs-project/blob/main/Images/deltavidsprod.gif?raw=true" alt="Prod GIF" width="100%" />
  </div>
</div>

<div style="text-align: center; margin: 20px 0;">
  <h3>Stage:</h3>
  <div style="width: 400px; margin: 0 auto; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <img src="https://github.com/YacqubAdan/delta-ecs-project/blob/main/Images/stagedelta.gif?raw=true" alt="Stage GIF" width="100%" />
  </div>
</div>

--- 


## Local Setup Vite



## Local Setup Packer



## Secure Multi-Stage Docker


## Terraform Structure

```
terraform/
├── environments/
│   ├── prod.tfvars
│   └── stage.tfvars
├── modules/
│   ├── acm/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── alb/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ecs/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── route53/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── backend.tf
├── main.tf
├── provider.tf
└── variables.tf
```

## Modules

-   **VPC**: Sets up the virtual private network, including subnets, route tables, internet gateways, and security groups.
-   **ALB**: Manages Application Load Balancers for distributing incoming traffic.
-   **ECS**: Deploys and manages Elastic Container Service clusters and tasks.
-   **Route53**: Configures DNS records using Route 53.
-   **ACM**: Provisions and manages AWS Certificate Manager certificates for SSL/TLS.

## Environments

-   **prod.tfvars**: Defines variables specific to the production environment.
-   **stage.tfvars**: Defines variables specific to the staging environment.

## Backend

-   `backend.tf`: Configures the Terraform backend for storing state remotely (in S3). This is essential for team collaboration and state management. Also for state locking use DynamoDB.

## Usage

1.  **Configure AWS Credentials**: Ensure your AWS credentials are properly configured.
2.  **Create Workspaces**: Run `terraform workspace new stage` & `terraform workspace new prod`
3.  **Initialise Terraform**: Run `terraform init` to initialise the modules and backend.
4.  **Select Environment**: Run `terraform workspace select stage` or `terraform workspace select stage`
5.  **Plan Changes**: Run `terraform plan -var-file="environments/stage.tfvars"` or `terraform plan -var-file="environments/prod.tfvars"` to preview the changes.
6.  **Apply Changes**: Run `terraform apply -var-file="environments/stage.tfvars"` or `terraform apply -var-file="environments/prod.tfvars"` to apply the changes.


## Vault Server



## Deployment Workflow



## AWS Services Used




## Architecture Diagram
