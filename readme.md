
# Terraform Project for GCP Infrastructure

This repository contains a Terraform project for building infrastructure on Google Cloud Platform (GCP) as part of the CloudSkillsBoost exercise named "Build Infrastructure with Terraform on Google Cloud: Challenge Lab".

## Project Structure

- `main.tf`: Main Terraform configuration file.
- `modules/instances/instances.tf`: Module for creating compute instances.
- `modules/storage/`: Module for creating storage resources (not detailed here).
- `modules/network/`: Modules for creating network resources using Terraform Google modules.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
- A Google Cloud project with billing enabled.
- Appropriate IAM permissions for creating resources in the GCP project.

## Usage

### 1. Clone the Repository

```sh
git clone <repository_url>
cd <repository_directory>
```

### 2. Configure Backend

Ensure the backend configuration in `main.tf` points to a valid GCS bucket:

```hcl
backend "gcs" {
  bucket  = "tf-bucket-372741"
  prefix  = "terraform/state"
}
```

### 3. Initialize Terraform

```sh
terraform init
```

### 4. Set Up Variables

Create a `terraform.tfvars` file to define your variables. For example:

```hcl
project_id = "your-gcp-project-id"
region     = "us-central1"
zone       = "us-central1-a"
```

### 5. Plan and Apply

Run the following commands to plan and apply the Terraform configuration:

```sh
terraform plan
terraform apply
```

### 6. Verify Resources

After applying the configuration, verify that the resources have been created in the GCP Console.

## Modules

### Instances

The `instances` module creates two compute instances with the specified configurations.

### Network

The network modules create a VPC and subnets using the Terraform Google modules.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Terraform](https://www.terraform.io/)
- [Google Cloud Platform](https://cloud.google.com/)
- [CloudSkillsBoost](https://www.cloudskillsboost.google/)
