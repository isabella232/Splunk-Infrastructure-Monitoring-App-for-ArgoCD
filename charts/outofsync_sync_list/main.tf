resource "signalfx_list_chart" "outofsync_sync_list" {
  name = "Apps with OUTOFSYNC Sync Status"
  description = "List of apps with OUTOFSYNC Sync Status"
  program_text = <<-EOF
B = data('argocd_app_info', filter=filter('sync_status', 'OutOfSync'), rollup='average').publish(label='B')
EOF

  legend_options_fields {
    property = "k8s.cluster.name"
    enabled = true
  }

  legend_options_fields {
    property = "name"
    enabled = true
  }

  legend_options_fields {
    property = "dest_server"
    enabled = false
  }

  legend_options_fields {
    property = "k8s.namespace.name"
    enabled = false
  }

  legend_options_fields {
    property = "instance"
    enabled = false
  }

  legend_options_fields {
    property = "scheme"
    enabled = false
  }

  legend_options_fields {
    property = "repo"
    enabled = false
  }

  legend_options_fields {
    property = "k8s.pod.uid"
    enabled = false
  }

  legend_options_fields {
    property = "project"
    enabled = false
  }

  legend_options_fields {
    property = "os.type"
    enabled = false
  }

  legend_options_fields {
    property = "k8s.pod.name"
    enabled = false
  }

  legend_options_fields {
    property = "dest_namespace"
    enabled = false
  }

  legend_options_fields {
    property = "health_status"
    enabled = false
  }

  legend_options_fields {
    property = "host.name"
    enabled = false
  }

  legend_options_fields {
    property = "service.name"
    enabled = false
  }

  legend_options_fields {
    property = "k8s.node.name"
    enabled = false
  }

  legend_options_fields {
    property = "port"
    enabled = false
  }

  legend_options_fields {
    property = "Plot Name"
    enabled = false
  }

  legend_options_fields {
    property = "namespace"
    enabled = false
  }

  legend_options_fields {
    property = "sync_status"
    enabled = false
  }

  legend_options_fields {
    property = "job"
    enabled = false
  }

  legend_options_fields {
    property = "metric (sf_metric)"
    enabled = false
  }

  legend_options_fields {
    property = "sf_originatingMetric"
    enabled = false
  }
}