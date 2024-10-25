terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}

resource "random_pet" "service_account_random_name" {
}

resource "google_service_account" "service_account" {
  account_id  = random_pet.service_account_random_name.id
  description = "Service Account for: ${var.repository_name}"
  project     = var.project
}

resource "google_project_iam_member" "project" {
  for_each = {
    for role_id in var.iam_role_ids : role_id => role_id
  }
  project = var.project
  role    = each.value

  member = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = "${google_service_account.service_account.account_id}-pool"
  description               = "GitHub OIDC for CI/CD"
  project                   = var.project
}

resource "google_iam_workload_identity_pool_provider" "oidc_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "${google_service_account.service_account.account_id}-provider"
  attribute_condition                = "assertion.repository_owner == '${var.repository_owner}'"
  attribute_mapping = {
    "google.subject"             = "assertion.sub",
    "attribute.actor"            = "assertion.actor",
    "attribute.repository"       = "assertion.repository",
    "attribute.repository_owner" = "assertion.repository_owner"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "workload_identity_pool_iam" {
  service_account_id = google_service_account.service_account.name
  role               = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/attribute.repository/${var.repository_name}"
}
