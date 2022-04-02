module "queue" {
  source  = "github.com/rafaelonline/terraform-aws-sqs-with-dlq"
  version = "v1"

  name  = var.name
  email = var.email

  policy_queue            = data.aws_iam_policy_document.queue.json
  policy_deadletter_queue = data.aws_iam_policy_document.deadletter_queue.json

  tags = var.tags

}