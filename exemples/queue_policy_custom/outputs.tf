############ queue ############
output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.queue.sqs_queue_id
}


output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.queue.sqs_queue_arn
}

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.queue.sqs_queue_name
}

########## deadletter ##########
output "sqs_deadletter_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.queue.sqs_deadletter_queue_id
}

output "sqs_deadletter_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.queue.sqs_deadletter_queue_arn
}

output "sqs_deadletter_queue_name" {
  description = "The name of the SQS queue"
  value       = module.queue.sqs_deadletter_queue_name
}