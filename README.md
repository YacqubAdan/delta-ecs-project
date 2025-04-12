# App: deltavids 

## Table of Contents 📚
- [App: deltavids](#app-deltavids)
  - [Table of Contents 📚](#table-of-contents-)
  - [🎥Live Demonstration](#live-demonstration)
  - [Local Setup Vite](#local-setup-vite)
  - [Local Setup Packer](#local-setup-packer)
  - [Secure Multi-Stage Docker](#secure-multi-stage-docker)
  - [Terraform Structure](#terraform-structure)
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

**Modules**
- VPC - setup virtual private network for environments including subnets, route tables, internet gateway and security groups
- ALB 
- ECS 
- Route53
- ACM

**Environments**


**Backend**

## Vault Server



## Deployment Workflow



## AWS Services Used




## Architecture Diagram
