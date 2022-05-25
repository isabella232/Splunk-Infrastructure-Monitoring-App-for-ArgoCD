# SignalFx dashboards for ArgoCD
ArgoCD observability dashboards for SignalFx. See Sample dashboard below.

ArgoCD servers produce a series of metrics which can be sent to SignalFx. The full list of metrics output by ArgoCD can be seen [here](https://argo-cd.readthedocs.io/en/stable/operator-manual/metrics/).

***
## Simple Setup
1. Set up SignalFx metrics ingestion
    1. Simplest method is to use [`Splunk Otel Collector`](https://github.com/signalfx/splunk-otel-collector) and expose the relevant ports for each [ArgoCD server](https://argo-cd.readthedocs.io/en/stable/operator-manual/metrics/).

2. Import dashboard module. Sample `dashboard.tf`
```
module "dashboard" {
    source              = "git@github.com:splunk/signalfx-argocd.git"
    signalfx_auth_token = var.signalfx_auth_token
}
```
3. Declare variables. Sample `variables.tf`
```
variable "signalfx_auth_token" {
  type        = string
}
```
4. Apply terraform. Example using [terraform CLI commands](https://www.terraform.io/cli).
```
# to build
terraform init
terraform apply

# to destroy
terraform destroy
```
***
## File structure
```
📦 terraform-signalfx
 ┣ 📂 charts
 ┃ ┗ 📂 app_count
 ┃ ┗ 📂 degraded_health
 ┃ ┗ 📂 health_status
 ┃ ┗ 📂 highest_apps
 ┃ ┗ 📂 missing_health
 ┃ ┗ 📂 missing_health_list
 ┃ ┗ 📂 out_of_sync
 ┃ ┗ 📂 outofsync_sync_list
 ┃ ┗ 📂 repo_count
 ┃ ┗ 📂 sync_status
 ┃ ┗ 📂 unknown_health
 ┃ ┗ 📂 unknown_health_list
 ┃ ┗ 📂 unknown_sync
 ┃ ┗ 📂 unknown_sync_list
 ┣ 📂 dashboard_groups
 ┃ ┗ 📂 argocd_dashboard_group
 ┗ 📂 dashboards
 ┃ ┗ 📂 app_performance
```
***

## Sample Dashboard
<img src="https://imgur.com/a/4lz6NrZ" width="300">

***
## Licensing
//todo