resource "signalfx_single_value_chart" "out_of_sync" {
  name = "OutOfSync Apps"
  description = "Number of apps with sync status OutOfSync"
  program_text = <<-EOF
A = data('argocd_app_info', filter=filter('sync_status', 'OutOfSync')).count().publish(label='A')
EOF
  color_by = "Scale"
  color_scale {
    gt = 10
    color = "red"
  }

  color_scale {
    lte = 10
    gt = 0
    color = "yellow"
  }

  color_scale {
    lte = 0
    color = "green"
  }
}