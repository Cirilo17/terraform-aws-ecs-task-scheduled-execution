variable name {
  description = "About this name."
  type        = string
}

variable enabled {
  description = "The boolean flag whether this execution is enabled or not. No execution when set to false."
  type        = bool
  default     = true
}

variable cluster_name {
  description = "ECS Fargate Cluster name."
  type        = string
}

variable ecs_task_definetion_family {
  description = "ECS Fargate Task Definetion family."
  type        = string
}

variable ecs_task_definetion_family_revision {
  description = "ECS Fargate Task Definetion family revision."
  type        = string
  default     = null
}

variable subnets {
  description = "Specify the subnet on which to run ECS Fargate."
  type        = list(string)
}

variable security_groups {
  description = "Specify the security groups to attach."
  type        = list(string)
}

variable assign_public_ip {
  description = "Choose whether to have your tasks receive a public IP address. If you are using Fargate tasks, in order for the task to pull the container image it must either use a public subnet and be assigned a public IP address or a private subnet that has a route to the internet or a NAT gateway that can route requests to the internet."
  type        = bool
  default     = false
}

variable cloudwatch_event_schedule_expression {
  description = "Schedule Expressions for Rules ex: cron(0 12 * * ? *), rate(5 minutes)."
  type        = string
}

variable cloudwatch_event_description {
  description = "CloudWatch Event Description."
  type        = string
  default     = "Invoke ECS Retry StepFunction StateMachine."
}

variable cloudwatch_event_role_name {
  description = "StepFunctions StateMachine invokable IAM Role name."
  type        = string
}


variable "cloudwatch_event_input" {
  description = "Valid JSON text passed to the target."
  default     = null
  type        = string
}

variable "cloudwatch_event_input_path" {
  description = "The value of the JSONPath that is used for extracting part of the matched event when passing it to the target."
  default     = null
  type        = string
}

variable "cloudwatch_event_input_transformer" {
  description = "Parameters used when you are providing a custom input to a target based on certain event data."
  type = set(object(
    {
      input_paths    = map(string)
      input_template = string
    }
  ))
  default = []
}

variable sfn_iam_role_name {
  description = "StateMachine IAM Role name."
  type        = string
}

variable sfn_comment {
  description = "StepFunctions StateMachine comment."
  type        = string
  default     = "ECS Task run."
}

variable ecs_task_need_retry_errors {
  description = "The errors you want to retry."
  type        = list(string)
  default     = ["States.TaskFailed", "States.Timeout"]
}

variable ecs_task_retry_interval_seconds {
  description = "An integer that represents the number of seconds before the first retry attempt."
  type        = number
  default     = 60
}

variable ecs_task_retry_max_attemps {
  description = "A positive integer that represents the maximum number of retry attempts. If the error recurs more times than specified, retries cease and normal error handling resumes. A value of 0 specifies that the error or errors are never retried."
  type        = number
  default     = 5
}

variable ecs_task_retry_backoff_rate {
  description = "The multiplier by which the retry interval increases during each attempt."
  type        = number
  default     = 2
}

variable ecs_task_ignore_retry_errors {
  description = "The errors you do not want to retry."
  type        = list(string)
  default     = ["States.Permissions"]
}

variable sfn_ecs_container_override {
  description = "A JSON string ContinerOverride settings."
  type        = string
  default     = "{}"
}

variable "sfn_timeout_seconds" {
  description = "If the task runs longer than the specified second the task takes a timeout to fail."
  type        = number
  default     = 99999999
}

variable tags {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

