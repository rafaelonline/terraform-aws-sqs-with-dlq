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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.60.0, <= 3.69.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.60.0, <= 3.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.deadletter_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_kms_alias.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_alias.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sns_topic.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sqs_queue.deadletter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.deadletter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_policy.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_arn.deadletter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_arn.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.deadletter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_sns_topic_arn"></a> [alarm\_sns\_topic\_arn](#input\_alarm\_sns\_topic\_arn) | ARN of the SNS topic for alarm notifactions | `string` | `""` | no |
| <a name="input_allowed_items_max"></a> [allowed\_items\_max](#input\_allowed\_items\_max) | The maximum number of items allowed on the SQS queue before it triggers an alarm | `string` | `10` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `false` | no |
| <a name="input_email"></a> [email](#input\_email) | Email of the SNS topic for alarm notifactions | `string` | `""` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `false` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | `string` | `""` | no |
| <a name="input_kms_master_key_id_sns"></a> [kms\_master\_key\_id\_sns](#input\_kms\_master\_key\_id\_sns) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | `string` | `""` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `345600` | no |
| <a name="input_name"></a> [name](#input\_name) | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | `string` | n/a | yes |
| <a name="input_policy_deadletter_queue"></a> [policy\_deadletter\_queue](#input\_policy\_deadletter\_queue) | A Policy custom of AWS account IDs allowed to access this resource | `string` | `""` | no |
| <a name="input_policy_queue"></a> [policy\_queue](#input\_policy\_queue) | A Policy custom of AWS account IDs allowed to access this resource | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `30` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->