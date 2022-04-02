data "aws_caller_identity" "current" {}

######### EXEMPLE POLICY CUSTOM #########

data "aws_iam_policy_document" "queue" {
  statement {
    effect    = "Allow"
    resources = [module.queue_policy_custom.sqs_queue_arn]
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
      "sqs:GetQueueAttributes",
    ]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/eks-lambda-role-garantias-1"]
    }
  }
}

data "aws_iam_policy_document" "deadletter_queue" {
  statement {
    effect    = "Allow"
    resources = [module.queue_policy_custom.sqs_deadletter_queue_arn]
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",



      "sqs:SendMessage",
    ]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/eks-lambda-role-garantias-1"]
    }
  }
}

######### EXEMPLE POLICY CUSTOM #########