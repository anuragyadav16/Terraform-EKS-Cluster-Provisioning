# Define the variables for the EKS cluster

aws_region              = "us-east-1"
environment_name        = "eks-blueprint"
eks_admin_role_name     = "Admin"

addons_repo_url = "https://github.com/aws-samples/eks-blueprints-add-ons.git"

workload_repo_url = "https://github.com/anuragyadav16/eks-blueprints-workloads.git"
workload_repo_revision = "main"
workload_repo_path     = "envs/dev"