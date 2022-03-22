
###### main.tf
```
variable "environment" {}

module "eks_fargate" {
  source = "github.com/faelvinicius/terraform-eks-module"
  name         = "eks-teste"
  region       = "us-east-1"
  environment  = var.environment  
}
```