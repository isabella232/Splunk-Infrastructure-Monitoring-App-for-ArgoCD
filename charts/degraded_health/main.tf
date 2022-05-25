resource "signalfx_single_value_chart" "degraded_health" {
  name = "Degraded Health"
  description = "Apps with health status DEGRADED"
  program_text = <<-EOF
A = data('argocd_app_info', filter=filter('health_status', 'Degraded')).count().publish(label='A')
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