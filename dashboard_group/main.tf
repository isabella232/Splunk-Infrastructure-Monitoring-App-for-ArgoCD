resource "signalfx_dashboard_group" "argocd_dashboard_group" {
    name = "ArgoCD"
}

module "app_status_dashboard" {
    source = "../dashboards/app_status_dashboard"
    dashboard_group_id = signalfx_dashboard_group.argocd_dashboard_group.id
}