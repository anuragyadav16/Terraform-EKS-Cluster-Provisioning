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

<details>
  <summary>Terraform Output (Click to Expand)</summary>

(base) anuragyadav@Anurags-MBP environment % terraform init

Initializing the backend...
Initializing modules...
Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 5.0.0 for vpc...
- vpc in .terraform/modules/vpc

Initializing provider plugins...
- Finding hashicorp/aws versions matching ">= 5.0.0, ~> 5.7"...
- Finding hashicorp/random versions matching "~> 3.5"...
- Installing hashicorp/aws v5.7.0...
- Installed hashicorp/aws v5.7.0 (signed by HashiCorp)
- Installing hashicorp/random v3.5.1...
- Installed hashicorp/random v3.5.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
(base) anuragyadav@Anurags-MBP environment %

</details>

Simulate infrastructure changes:
```bash
terraform plan
```

<details>
  <summary>Terraform Output (Click to Expand)</summary>

(base) anuragyadav@Anurags-MBP environment % terraform plan
data.aws_availability_zones.available: Reading...
data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_secretsmanager_secret.argocd will be created
  + resource "aws_secretsmanager_secret" "argocd" {
      + arn                            = (known after apply)
      + force_overwrite_replica_secret = false
      + id                             = (known after apply)
      + name                           = "argocd-admin-secret.eks-blueprint"
      + name_prefix                    = (known after apply)
      + policy                         = (known after apply)
      + recovery_window_in_days        = 0
      + tags_all                       = (known after apply)
    }

  # aws_secretsmanager_secret_version.argocd will be created
  + resource "aws_secretsmanager_secret_version" "argocd" {
      + arn            = (known after apply)
      + id             = (known after apply)
      + secret_id      = (known after apply)
      + secret_string  = (sensitive value)
      + version_id     = (known after apply)
      + version_stages = (known after apply)
    }

  # random_password.argocd will be created
  + resource "random_password" "argocd" {
      + bcrypt_hash      = (sensitive value)
      + id               = (known after apply)
      + length           = 16
      + lower            = true
      + min_lower        = 0
      + min_numeric      = 0
      + min_special      = 0
      + min_upper        = 0
      + number           = true
      + numeric          = true
      + override_special = "!#$%&*()-_=+[]{}<>:?"
      + result           = (sensitive value)
      + special          = true
      + upper            = true
    }

  # module.vpc.aws_default_network_acl.this[0] will be created
  + resource "aws_default_network_acl" "this" {
      + arn                    = (known after apply)
      + default_network_acl_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)

      + egress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + egress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }

      + ingress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + ingress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }
    }

  # module.vpc.aws_default_route_table.default[0] will be created
  + resource "aws_default_route_table" "default" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "5m"
          + update = "5m"
        }
    }

  # module.vpc.aws_default_security_group.this[0] will be created
  + resource "aws_default_security_group" "this" {
      + arn                    = (known after apply)
      + description            = (known after apply)
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + tags_all             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_internet_gateway.this[0] will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + tags_all = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.this[0] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + tags_all             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[0] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.public_internet_gateway[0] will be created
  + resource "aws_route" "public_internet_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-private"
        }
      + tags_all         = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-private"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-public"
        }
      + tags_all         = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-public"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[2] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[2] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.40.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1a"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1a"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.44.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1b"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1b"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[2] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.48.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1c"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1c"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.0.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1a"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1a"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1b"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1b"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[2] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.8.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1c"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1c"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + tags_all                             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
    }

Plan: 26 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc_id = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
(base) anuragyadav@Anurags-MBP environment %

</details>


Apply changes to infrastructure resources:
```bash
terraform apply -auto-approve
```

<details>
  <summary>Terraform Output (Click to Expand)</summary>

(base) anuragyadav@Anurags-MBP environment % terraform apply -auto-approve
data.aws_availability_zones.available: Reading...
data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_secretsmanager_secret.argocd will be created
  + resource "aws_secretsmanager_secret" "argocd" {
      + arn                            = (known after apply)
      + force_overwrite_replica_secret = false
      + id                             = (known after apply)
      + name                           = "argocd-admin-secret.eks-blueprint"
      + name_prefix                    = (known after apply)
      + policy                         = (known after apply)
      + recovery_window_in_days        = 0
      + tags_all                       = (known after apply)
    }

  # aws_secretsmanager_secret_version.argocd will be created
  + resource "aws_secretsmanager_secret_version" "argocd" {
      + arn            = (known after apply)
      + id             = (known after apply)
      + secret_id      = (known after apply)
      + secret_string  = (sensitive value)
      + version_id     = (known after apply)
      + version_stages = (known after apply)
    }

  # random_password.argocd will be created
  + resource "random_password" "argocd" {
      + bcrypt_hash      = (sensitive value)
      + id               = (known after apply)
      + length           = 16
      + lower            = true
      + min_lower        = 0
      + min_numeric      = 0
      + min_special      = 0
      + min_upper        = 0
      + number           = true
      + numeric          = true
      + override_special = "!#$%&*()-_=+[]{}<>:?"
      + result           = (sensitive value)
      + special          = true
      + upper            = true
    }

  # module.vpc.aws_default_network_acl.this[0] will be created
  + resource "aws_default_network_acl" "this" {
      + arn                    = (known after apply)
      + default_network_acl_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)

      + egress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + egress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }

      + ingress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + ingress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }
    }

  # module.vpc.aws_default_route_table.default[0] will be created
  + resource "aws_default_route_table" "default" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "5m"
          + update = "5m"
        }
    }

  # module.vpc.aws_default_security_group.this[0] will be created
  + resource "aws_default_security_group" "this" {
      + arn                    = (known after apply)
      + description            = (known after apply)
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + tags_all               = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-default"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + tags_all             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_internet_gateway.this[0] will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + tags_all = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.this[0] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
      + tags_all             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-us-east-1a"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[0] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.public_internet_gateway[0] will be created
  + resource "aws_route" "public_internet_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-private"
        }
      + tags_all         = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-private"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-public"
        }
      + tags_all         = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint-public"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[2] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[2] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.40.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1a"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1a"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.44.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1b"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1b"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[2] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.48.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1c"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"                       = "eks-blueprint"
          + "GithubRepo"                      = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                            = "eks-blueprint-private-us-east-1c"
          + "kubernetes.io/role/internal-elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.0.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1a"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1a"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1b"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1b"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[2] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.8.0/22"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1c"
          + "kubernetes.io/role/elb" = "1"
        }
      + tags_all                                       = {
          + "Blueprint"              = "eks-blueprint"
          + "GithubRepo"             = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"                   = "eks-blueprint-public-us-east-1c"
          + "kubernetes.io/role/elb" = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
      + tags_all                             = {
          + "Blueprint"  = "eks-blueprint"
          + "GithubRepo" = "github.com/aws-ia/terraform-aws-eks-blueprints"
          + "Name"       = "eks-blueprint"
        }
    }

Plan: 26 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc_id = (known after apply)
random_password.argocd: Creating...
random_password.argocd: Creation complete after 0s [id=none]
aws_secretsmanager_secret.argocd: Creating...
module.vpc.aws_vpc.this[0]: Creating...
aws_secretsmanager_secret.argocd: Creation complete after 0s [id=arn:aws:secretsmanager:us-east-1:605137147419:secret:argocd-admin-secret.eks-blueprint-5emQ1U]
aws_secretsmanager_secret_version.argocd: Creating...
aws_secretsmanager_secret_version.argocd: Creation complete after 1s [id=arn:aws:secretsmanager:us-east-1:605137147419:secret:argocd-admin-secret.eks-blueprint-5emQ1U|5501AAA8-9B46-4C6C-956B-9207918CFB61]
module.vpc.aws_vpc.this[0]: Still creating... [10s elapsed]
module.vpc.aws_vpc.this[0]: Creation complete after 11s [id=vpc-00fe7f8b8b6a53690]
module.vpc.aws_default_route_table.default[0]: Creating...
module.vpc.aws_default_security_group.this[0]: Creating...
module.vpc.aws_route_table.private[0]: Creating...
module.vpc.aws_internet_gateway.this[0]: Creating...
module.vpc.aws_subnet.private[2]: Creating...
module.vpc.aws_subnet.public[2]: Creating...
module.vpc.aws_subnet.public[0]: Creating...
module.vpc.aws_subnet.private[0]: Creating...
module.vpc.aws_subnet.private[1]: Creating...
module.vpc.aws_default_network_acl.this[0]: Creating...
module.vpc.aws_internet_gateway.this[0]: Creation complete after 1s [id=igw-0dbfd66d7ab8ef839]
module.vpc.aws_subnet.public[1]: Creating...
module.vpc.aws_subnet.private[2]: Creation complete after 1s [id=subnet-065398681c6222d5b]
module.vpc.aws_subnet.private[1]: Creation complete after 1s [id=subnet-020e4dcf4ccf59a31]
module.vpc.aws_route_table.private[0]: Creation complete after 1s [id=rtb-08769cb1d3e2b548a]
module.vpc.aws_route_table.public[0]: Creating...
module.vpc.aws_eip.nat[0]: Creating...
module.vpc.aws_default_route_table.default[0]: Creation complete after 1s [id=rtb-0c3481ec75386e708]
module.vpc.aws_subnet.public[2]: Creation complete after 1s [id=subnet-01b5f3a786179359f]
module.vpc.aws_subnet.private[0]: Creation complete after 1s [id=subnet-053e24148d93d54fe]
module.vpc.aws_route_table_association.private[0]: Creating...
module.vpc.aws_route_table_association.private[1]: Creating...
module.vpc.aws_route_table_association.private[2]: Creating...
module.vpc.aws_subnet.public[0]: Creation complete after 1s [id=subnet-01ef9a47fd7310fca]
module.vpc.aws_eip.nat[0]: Creation complete after 1s [id=eipalloc-0b953f1a1e68c35e9]
module.vpc.aws_subnet.public[1]: Creation complete after 1s [id=subnet-0ecc3c7a16831a3b8]
module.vpc.aws_nat_gateway.this[0]: Creating...
module.vpc.aws_route_table.public[0]: Creation complete after 1s [id=rtb-03d3b23a24dd56785]
module.vpc.aws_route_table_association.public[0]: Creating...
module.vpc.aws_route_table_association.public[2]: Creating...
module.vpc.aws_route_table_association.public[1]: Creating...
module.vpc.aws_route.public_internet_gateway[0]: Creating...
module.vpc.aws_default_security_group.this[0]: Creation complete after 2s [id=sg-0026a0050f0bd467e]
module.vpc.aws_default_network_acl.this[0]: Creation complete after 2s [id=acl-00e5891fe23843b93]
module.vpc.aws_route_table_association.private[1]: Creation complete after 1s [id=rtbassoc-0dd8c93c2e496fed7]
module.vpc.aws_route_table_association.public[2]: Creation complete after 0s [id=rtbassoc-05e98d2692447e564]
module.vpc.aws_route_table_association.public[0]: Creation complete after 0s [id=rtbassoc-0ff78212627f2ed4b]
module.vpc.aws_route_table_association.public[1]: Creation complete after 0s [id=rtbassoc-0792fedc4c2872e6e]
module.vpc.aws_route_table_association.private[2]: Creation complete after 1s [id=rtbassoc-0751e67c79d844cfd]
module.vpc.aws_route_table_association.private[0]: Creation complete after 1s [id=rtbassoc-0cadda902dca61386]
module.vpc.aws_nat_gateway.this[0]: Still creating... [10s elapsed]
module.vpc.aws_route.public_internet_gateway[0]: Still creating... [10s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [20s elapsed]
module.vpc.aws_route.public_internet_gateway[0]: Still creating... [20s elapsed]
module.vpc.aws_route.public_internet_gateway[0]: Creation complete after 20s [id=r-rtb-03d3b23a24dd567851080289494]
module.vpc.aws_nat_gateway.this[0]: Still creating... [30s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [40s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [50s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [1m0s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [1m10s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [1m20s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [1m30s elapsed]
module.vpc.aws_nat_gateway.this[0]: Still creating... [1m40s elapsed]
module.vpc.aws_nat_gateway.this[0]: Creation complete after 1m45s [id=nat-02505ddf23106012f]
module.vpc.aws_route.private_nat_gateway[0]: Creating...
module.vpc.aws_route.private_nat_gateway[0]: Creation complete after 1s [id=r-rtb-08769cb1d3e2b548a1080289494]

Apply complete! Resources: 26 added, 0 changed, 0 destroyed.

Outputs:

vpc_id = "vpc-00fe7f8b8b6a53690"
(base) anuragyadav@Anurags-MBP environment %

<details>

## Contributing
Contributions, issues and feature requests are welcome!

## License
Distributed under the MIT License. See LICENSE for more information.