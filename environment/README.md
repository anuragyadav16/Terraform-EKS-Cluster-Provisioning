# Creating a Shared Environment with Terraform

This section outlines the steps to create a shared environment using Terraform. Separating environment creation from the EKS cluster creation offers flexibility for future updates, and facilitates seamless blue/green or canary migrations.


## Pre-requisites
- AWS Account
- AWS CLI installed and configured with your AWS Account
- Terraform (Version 1.5.0 or higher)


## Setting Up Your Terraform Project

### 1. Define the versions of Terraform and providers
    
These provider requirements mentioned in versions.tf ensure that the correct versions are used when running Terraform commands for this project.

### 2. Define the variables for your Terraform stack
    
These include the environment name, AWS region, VPC CIDR, and a suffix for creating a secret for ArgoCD for later stage.

### 3. Create the main configuration file main.tf for your Terraform project
    
This Terraform code configures the AWS provider, retrieves availability zones, creates local variables, provisions a VPC with subnets using the AWS VPC Terraform module, and includes additional resource configurations like an AWS Secret Manager secret for ArgoCD deployment.

### 4.Create outputs.tf file:

The outputs.tf file contains the definitions of outputs that provide information about the provisioned VPC. These outputs can be used to retrieve important details about the provisioned infrastructure.

### 5.Provide variables

Use a variables file to provide specific deployment data to your Terraform modules


![Alt text](https://drive.google.com/uc?export=view&id=1DsVUDfF6bHQzPTZP9e05uGIF00fIMNte)


<details>
  <summary>Click to expand!</summary>

  jgjgjhk
  blah
  blaah

</details>





## Cloning the Repository
To get started, clone the repository with the EKS Terraform Blueprints :

```bash
git clone https://github.com/anuragyadav16/Terraform-EKS-Cluster-Provisioning.git
```

## Setting Up
Navigate to the cloned repository. You'll find Terraform files that describe the EKS cluster's infrastructure. Customize these files as per your organization's needs.

## Provisioning the Infrastructure
To provision the EKS Cluster, follow the steps below:

## Contributing
Contributions, issues and feature requests are welcome!

## License
Distributed under the MIT License. See LICENSE for more information.