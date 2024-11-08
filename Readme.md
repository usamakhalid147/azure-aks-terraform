# Azure AKS Terraform Deployment

This repository provides an automated setup for deploying Azure Kubernetes Service (AKS) using Terraform. The setup includes infrastructure configuration, deployment scripts, and prerequisites required to deploy an AKS cluster on Azure.

## Prerequisites

1. **Azure CLI**: Ensure you have the Azure CLI installed on your machine. You can install it by following the [Azure CLI installation guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
2. **Terraform**: Ensure that Terraform is installed. You can install it by following the [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

## Getting Started

### Step 1: Authenticate with Azure

Before running any Terraform commands, you need to log in to your Azure account using the Azure CLI:


az login
Step 2: Initialize Terraform
Navigate to the root of the repository and initialize Terraform. This will download the necessary provider plugins:

terraform init
Step 3: Review and Configure Variables
Update the variables.tf file or create a terraform.tfvars file to set values for variables specific to your Azure setup, such as:

resource_group_name
location
aks_cluster_name
node_count
Any other variables you wish to configure
Step 4: Plan the Deployment
Generate an execution plan to see the actions Terraform will take to deploy the infrastructure:

terraform plan
Step 5: Apply the Configuration
Apply the configuration to create the AKS cluster on Azure. Confirm the prompt to proceed with the deployment:

terraform apply
Step 6: Access the AKS Cluster
After deployment, configure kubectl to connect to the AKS cluster:

az aks get-credentials --resource-group <resource_group_name> --name <aks_cluster_name>
Step 7: Verify the Cluster
To verify the cluster is running correctly, use the following command to get the status of nodes:

kubectl get nodes
Cleanup
To delete the AKS cluster and other resources created by this Terraform configuration, run:

terraform destroy
License

This project is licensed under the MIT License. See the LICENSE file for details.


This format should be compatible as a `README.md` file, with clear steps for setup, usage, and cleanup of your Azure AKS Terraform deployment.
