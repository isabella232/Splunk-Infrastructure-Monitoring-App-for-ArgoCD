resource "signalfx_single_value_chart" "repo_count" {
  name = "Number of Repositories"
  description = "Returns the number of repositories connected to ArgoCD"
  program_text = <<-EOF
A = data('argocd_git_request_total').count(by=['repo']).count().publish(label='A')
EOF

}