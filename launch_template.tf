resource "aws_launch_template" "node" {

  name_prefix            = join("-", ["lt", local.name])
  update_default_version = true

  ebs_optimized = var.ebs_optimized
  image_id      = var.ami_id

  instance_type = var.instance_types

  vpc_security_group_ids = [aws_security_group.node_group_sg.id]

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 10
      delete_on_termination = true
      volume_type           = "gp2"
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = format("%s-node-group", local.name)
    }
  }
}

