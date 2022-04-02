module "queue" {
  source = "github.com/rafaelonline/terraform-aws-sqs-with-dlq"

  name  = var.name
  email = var.email

  tags = var.tags

}