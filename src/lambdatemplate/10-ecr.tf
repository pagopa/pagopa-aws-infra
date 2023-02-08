# Resource related to the container registry repository
resource "aws_ecr_repository" "lambdatemplate_ecr" {
  name                 = local.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Data related to Docker lambda image
data "aws_ecr_image" "lambdatemplate_image" {
  repository_name = aws_ecr_repository.lambdatemplate_ecr.name
  image_tag       = local.ecr_image_tag
}