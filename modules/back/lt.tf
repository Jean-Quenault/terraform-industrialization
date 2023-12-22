resource "aws_launch_template" "back" {
  # Name of the launch template
  name                  = "back"

  # ID of the Amazon Machine Image (AMI) to use for the instance
  image_id              = "ami-066be587ddea5d4ed"

  # Instance type for the EC2 instance
  instance_type         = "t2.micro"

  # Block device mappings for the instance
  block_device_mappings {
    device_name         = "/dev/sda1"

    ebs {
      # Size of the EBS volume in GB
      volume_size       = 8

      # Type of EBS volume (General Purpose SSD in this case)
      volume_type       = "gp2"
    }
  }

  # Network interface configuration
  network_interfaces {
    # Associates a public IP address with the instance
    associate_public_ip_address = true

    # Security groups to associate with the instance
    security_groups     = [aws_security_group.back_asg.id]
  }

    user_data = base64encode(<<EOF
#!/bin/bash
aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.ecr_back_url}
docker run -d -p 80:${var.back_port} ${var.ecr_back_url}/${var.back_image}:${var.back_image_tag}
    EOF
    )

  iam_instance_profile {
        arn             = aws_iam_instance_profile.back_instance_profile.arn
    }
  
  # Tag specifications for the instance
  tag_specifications {
    # Specifies the resource type as "instance"
    resource_type       = "instance"

    # Tags to apply to the instance
    tags = {
      Name = "back"
    }
  }
}