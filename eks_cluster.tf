resource "aws_eks_cluster" "eks_cluster" {

  name                    = local.name
  role_arn                = aws_iam_role.eks_master_role.arn
  version                 = var.kubernetes_version
   
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    endpoint_private_access = var.endpoint_private_access 
    endpoint_public_access  = var.endpoint_public_access

    subnet_ids = [
      aws_subnet.eks_subnet_private_1a.id, 
      aws_subnet.eks_subnet_private_1b.id,
      aws_subnet.eks_subnet_private_1c.id
    ]
      
  }

  timeouts {
    delete = "30m"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_cluster,
    aws_iam_role_policy_attachment.eks_cluster_service
  ]

}