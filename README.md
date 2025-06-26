# Three-Tier Cloud Infrastructure with Terraform (AWS)

This project provisions a secure and scalable three-tier architecture on AWS using Terraform. It includes:

- **VPC** with public/private subnets across AZs  
- **EC2** in public subnet  
- **RDS MySQL** in private subnet  
- **Application Load Balancer**  
- **Remote state backend (S3 + DynamoDB)**

---

## 🗂️ Project Structure

.
├── backend.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
└── modules/
├── vpc/
├── sg/
├── ec2/
├── rds/
└── alb/

---

## 🔧 Prerequisites

- ✅ AWS CLI installed and configured (`aws configure`)
- ✅ Terraform v1.3+ installed
- ✅ Create backend S3 bucket and DynamoDB table using AWS CLI:

```bash
aws s3api create-bucket --bucket your-terraform-state-bucket --region us-east-1

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
  --region us-east-1


1.Clone this repository
git clone https://github.com/Atharva116hub/Three-Tier-Cloud-Infrastructure-with-Terraform.git
cd Three-Tier-Cloud-Infrastructure-with-Terraform

2.Review/Edit terraform.tfvars
Make sure the AWS region, AZs, subnet CIDRs, and key name are accurate.

3.Initialize Terraform
terraform init 

4.Review Plan
terraform plan 

5.Apply Infrastructure
terraform apply 
*Confirm with yes when prompted.*

*Outputs
VPC ID

EC2 Instance ID & Public IP

RDS Endpoint

ALB DNS Name

6.Cleanup
terraform destroy
