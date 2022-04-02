# Terraform module AWS SQS with DLQ

Terraform Module for creating an SQS queue and an accompanying dead letter queue (dlq).

This module automatically adds:

- `.fifo` if a fifo queue is selected

- CloudWatch alarm (with notification by e-mail) for items on the dlq and large numbers of
items on a queue
- A default policy to the queue
- Allows for easy adding of custom policy to the queue/dlq
- Enables encrypted queues using the CMK account key

## Examples

- [SQS queue](./exemples/queue/)
- [SQS fifo queue](./exemples/fifo_queue/)
- [SQS queue with policy custom](./exemples/queue_policy_custom/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->