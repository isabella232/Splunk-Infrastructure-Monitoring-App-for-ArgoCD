resource "signalfx_single_value_chart" "unknown_health" {
  name = "Unknown Health"
  description = "Apps with health status MISSING. Indicates that some resources are not deployed"
  program_text = <<-EOF
A = data('argocd_app_info', filter=filter('health_status', 'Unknown')).count().publish(label='A')
EOF
  color_by = "Scale"
  color_scale {
    gt = 5
    color = "red"
  }
  color_scale {
    lte = 5
    gt = 0
    color = "yellow"
  }
  color_scale {
    lte = 0
    color = "green"
  }
}