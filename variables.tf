variable "project" {
  description = "The project the service account will be created in."
  type        = string
}

variable "repository_name" {
  description = "The name of the repository."
  type        = string
}

variable "iam_role_ids" {
  type        = list(string)
  description = "List of Role ID's that will be added to the service account."
}