data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh.tpl")

  vars = {
    region          = var.region
    ecr_front_url   = var.ecr_front_url
    front_port      = var.front_port
    front_image     = var.front_image
    front_image_tag = var.front_image_tag
  }
}
