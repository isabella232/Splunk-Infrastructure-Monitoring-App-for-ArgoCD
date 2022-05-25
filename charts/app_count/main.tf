resource "signalfx_single_value_chart" "app_count" {
  name = "Number of Apps"
  description = "Returns the number of apps on ArgoCD"
  program_text = <<-EOF
A = data('argocd_app_sync_total').count().publish(label='A')
EOF

}