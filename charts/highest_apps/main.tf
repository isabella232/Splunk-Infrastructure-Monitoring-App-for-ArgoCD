resource "signalfx_time_chart" "highest_apps" {
  name = "Number of applications by project (top 5)"
  description = "Returns the top 5 project which has the highest number of applications"
  program_text = <<-EOF
A = data('argocd_app_info').count(by=['project']).top(count=5).publish(label='A')
EOF

  axis_left {
    label = "Number of apps"
  }
  on_chart_legend_dimension = "health_status"

}