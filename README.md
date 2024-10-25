# Workload Identity Provider Service Account

This module creates a service account and Workload Identity Provider (WIP) with the scope necessary to be used for creation of a GitHub Action. 

Any other permissions will need to be added to the service account after the WIP is created. 

## Usage in GitHub Actions

The module outputs a `wif_provider` and `wif_service_account` to be used in the GitHub action. You will need to create a secret in the GitHub project with the same names and add the outputs. 
