variable "iam_role_ids" {
  type        = list(string)
  description = "List of Role ID's that will be added to the service account."
}

variable "project" {
  type        = string
  description = "The project the service account will be created in."
}

variable "repository_name" {
  type        = string
  description = "The name of the repository."
}

variable "repository_owner" {
  type        = string
  description = "The owner of the repository for claim validation."
}