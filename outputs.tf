output "wif_service_account" {
  value       = google_service_account.service_account.email
  description = "The email of the Google Cloud Service Account."
}

output "wif_provider" {
  value       = google_iam_workload_identity_pool_provider.oidc_provider.name
  description = "The full provider path for the Workload Identity Pool."
}