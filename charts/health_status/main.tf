resource "signalfx_heatmap_chart" "health_status" {
  name = "Apps by health status"
  description = "Count of apps by health status"
  program_text = <<-EOF
A = data('argocd_app_info').publish(label='A')
EOF

  group_by = ["health_status"]
  
  color_range {
    min_value = 1
    max_value = 2
    color     = "#6495ED"
  }

}