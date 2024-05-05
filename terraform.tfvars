region              = "us-east-2"
env                 = "Dev"
vpc_cidr            = "10.100.0.0/16"
vpc_name            = "Union-Bank"
Public_Subnet_Cidr  = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
Private_Subnet_Cidr = ["10.100.10.0/24", "10.100.20.0/24", "10.100.30.0/24"]
az                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
ami = {
  "us-east-2"  = "ami-09040d770ffe2224f"
  "ap-south-1" = "ami-0f58b397bc5c1f2e8"
}
key = "Terraform_Default"
