# Terraform_Codes
Terraform Code files 


# Terraform EC2 Instance Configuration

This repository contains Terraform code to provision and manage an EC2 instance on AWS.

## Getting Started

To get started, follow the instructions below:

### Prerequisites

Before running the Terraform commands, ensure you have the following prerequisites installed:

- Terraform: You can download and install Terraform from the official website: https://www.terraform.io/downloads.html
- AWS Account: You'll need an AWS account with appropriate permissions to create EC2 instances.

### Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/Ansumanbhujabal/Terraform_Codes.git
    ```

2. Move into the cloned directory:

    ```bash
    cd Terraform_Codes
    ```

3. Move the `ec2.tf` file to the current directory:

    ```bash
    mv /Terraform_codes/ec2.tf .
    ```

4. Create a `provider.tf` file and add your AWS credentials:

    ```hcl
    provider "aws" {
      region     = "your_aws_region"
      access_key = "your_access_key_id"
      secret_key = "your_secret_access_key"
    }
    ```

   Replace `"your_aws_region"`, `"your_access_key_id"`, and `"your_secret_access_key"` with your actual AWS region and credentials.

### Usage

1. Initialize Terraform in the project directory:

    ```bash
    terraform init
    ```

2. Plan the changes to be applied:

    ```bash
    terraform plan
    ```

3. Apply the Terraform configuration to create the EC2 instance:

    ```bash
    terraform apply
    ```

4. To destroy the EC2 instance and associated resources:

    ```bash
    terraform destroy
    ```

## Author

[Ansuman Simanta Sekhar Bhujabala]

