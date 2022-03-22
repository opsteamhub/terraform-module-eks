resource "aws_iam_openid_connect_provider" "main" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.main.certificates.0.sha1_fingerprint]
  url             = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

data "aws_iam_openid_connect_provider" "main_arn" {
  arn = aws_iam_openid_connect_provider.main.arn
}


