resource "signalfx_single_value_chart" "unknown_sync" {
  name = "UNKNOWN Sync Apps"
  description = "Number of apps with sync status UNKNOWN"
  program_text = <<-EOF
A = data('argocd_app_info', filter=filter('sync_status', 'Unknown')).count().publish(label='A')
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