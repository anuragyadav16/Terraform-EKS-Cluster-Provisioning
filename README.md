# AWS EKS Cluster Provisioning using Terraform Blueprints

This guide provides instructions on how to provision an AWS EKS Cluster using Terraform Blueprints. The aim is to streamline the process of deploying and managing a Kubernetes infrastructure on AWS, providing more speed, flexibility, and standardization.


## Key Features of the Blueprint

#### - Security and Compliance
        The blueprints come with baked-in security best practices, reducing the need for manual ad-hoc security configurations.

#### - Cost Management
        The deployment strategy and resources used in the blueprints are optimized for cost.

#### - Deployment Automation
        Manual deployment processes are replaced with automated pipelines. Software delivery is now faster and more consistent.

#### - Infrastructure Provisioning
        With these blueprints, infrastructure can be provisioned on-demand, reducing the waiting time from weeks to mere minutes.

#### - Telemetry
        The blueprints allow for full instrumentation of applications for metric and log collection. This results in increased visibility into applications running in production.


## Pre-requisites

- AWS Account
- AWS CLI installed and configured with your AWS Account
- Terraform (Version 0.12 or higher)


## Cloning the Repository
To get started, clone the repository with the EKS Terraform Blueprints. Replace <repository_url> with the URL of the blueprint repository:

```bash
git clone <repository_url>
```

Setting Up
Navigate to the cloned repository. You'll find Terraform files that describe the EKS cluster's infrastructure. Customize these files as per your organization's needs.

Provisioning the Infrastructure
To provision the EKS Cluster, follow the steps below: