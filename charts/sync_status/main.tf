resource "signalfx_heatmap_chart" "sync_status" {
  name = "Apps by sync status"
  description = "Count of apps by sync status"
  program_text = <<-EOF
A = data('argocd_app_info').publish(label='A')
EOF

  group_by = ["sync_status"]
  
  color_range {
    min_value = 1
    max_value = 2
    color     = "#6495ED"
  }

}