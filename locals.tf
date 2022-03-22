locals {
    name     = join("-", [var.environment, var.name])
    log_name = join("-", ["/aws/eks", local.name])
}