resource "aws_launch_template" "front" {
  # Name of the launch template
  name          = "front"

  # ID of the Amazon Machine Image (AMI) to use for the instance
  image_id      = "ami-066be587ddea5d4ed"

  # Instance type for the EC2 instance
  instance_type = "t2.micro"

  # Block device mappings for the instance
  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      # Size of the EBS volume in GB
      volume_size = 8

      # Type of EBS volume (General Purpose SSD in this case)
      volume_type = "gp2"
    }
  }

  # Network interface configuration
  network_interfaces {
    # Associates a public IP address with the instance
    associate_public_ip_address = true

    # Security groups to associate with the instance
    security_groups = [aws_security_group.front_asg.id]
  }

    /*user_data = base64encode(<<EOF
        #!/bin/bash
        aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 980377181750.dkr.ecr.eu-west-3.amazonaws.com
        docker run -d -p 80:80 980377181750.dkr.ecr.eu-west-3.amazonaws.com/front:13
    EOF
    )*/

    user_data = base64encode(<<EOF
        #!/bin/bash
        aws ecr get-login-password --region ${var.region}| docker login --username AWS --password-stdin ${var.ecr_url}
        docker run -d -p ${var.front_port}:80 ${var.ecr_url}/${var.front_image}:${var.front_image_tag}
    EOF
    )

  
  # Tag specifications for the instance
  tag_specifications {
    # Specifies the resource type as "instance"
    resource_type = "instance"

    # Tags to apply to the instance
    tags = {
      Name = "front"
    }
  }
}