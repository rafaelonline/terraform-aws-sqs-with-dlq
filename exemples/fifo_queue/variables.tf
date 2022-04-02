variable "name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "email" {
  description = "Email of the SNS topic for alarm notifactions"
  type        = string
  default     = ""
}

