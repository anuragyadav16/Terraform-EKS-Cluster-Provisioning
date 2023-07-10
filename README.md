# AWS EKS Cluster Provisioning using Terraform Blueprints

This guide provides instructions on how to provision an AWS EKS Cluster using Terraform Blueprints. The aim is to streamline the process of deploying and managing a Kubernetes infrastructure on AWS, providing more speed, flexibility, and standardization.


## Key Features of the Blueprint

- #### Security and Compliance
    The blueprints come with baked-in security best practices, reducing the need for manual ad-hoc security configurations.

- #### Cost Management
    The deployment strategy and resources used in the blueprints are optimized for cost.

- #### Deployment Automation
    Manual deployment processes are replaced with automated pipelines. Software delivery is now faster and more consistent.

- #### Infrastructure Provisioning
    With these blueprints, infrastructure can be provisioned on-demand, reducing the waiting time from weeks to mere minutes.

- #### Telemetry
    The blueprints allow for full instrumentation of applications for metric and log collection. This results in increased visibility into applications running in production.


## Pre-requisites

- AWS Account
- AWS CLI installed and configured with your AWS Account
- Terraform (Version 1.5.0 or higher)


## Cloning the Repository
To get started, clone the repository with the EKS Terraform Blueprints :

```bash
git clone https://github.com/anuragyadav16/Terraform-EKS-Cluster-Provisioning.git
```

## Setting Up
Navigate to the cloned repository. You'll find Terraform files that describe the EKS cluster's infrastructure. Customize these files as per your organization's needs.

## Provisioning the Infrastructure
To provision the EKS Cluster, follow the steps below:

## 1. Create shared environment

Creates a symbolic link (shortcut) to the terraform.tfvars file from the Terraform-EKS-Cluster-Provisioning directory into the environment directory. This allows the terraform.tfvars file to be easily accessible and used within the environment directory for the Terraform configuration. Later Navigate to environment folder and execute terraform commands.

```bash
ln -s ~/Terraform-EKS-Cluster-Provisioning/terraform.tfvars ~/Terraform-EKS-Cluster-Provisioning/environment/terraform.tfvars
```

Change working directory to appropriate location:
```bash
cd environment/
```

Prepare Terraform working directory:
```bash
terraform init
```

Simulate infrastructure changes:
```bash
terraform plan
```

Apply changes to infrastructure resources:
```bash
terraform apply -auto-approve
```

## Contributing
Contributions, issues and feature requests are welcome!

## License
Distributed under the MIT License. See LICENSE for more information.