module "queue" {
  source = "github.com/rafaelonline/terraform-aws-sqs-with-dlq"

  name  = var.name
  email = var.email

  fifo_queue = true

  tags = var.tags

}