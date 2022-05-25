module "app_count" {
  source = "../../charts/app_count"
}

module "repo_count" {
  source = "../../charts/repo_count"
}

module "highest_apps" {
  source = "../../charts/highest_apps"
}

module "health_status" {
  source = "../../charts/health_status"
}

module "sync_status" {
  source = "../../charts/sync_status"
}

module "degraded_health" {
  source = "../../charts/degraded_health"
}

module "missing_health" {
  source = "../../charts/missing_health"
}

module "unknown_health" {
  source = "../../charts/unknown_health"
}

module "out_of_sync" {
  source = "../../charts/out_of_sync"
}

module "unknown_sync" {
  source = "../../charts/unknown_sync"
}

module "missing_health_list" {
  source = "../../charts/missing_health_list"
}

module "unknown_health_list" {
  source = "../../charts/unknown_health_list"
}

module "degraded_health_list" {
  source = "../../charts/degraded_health_list"
}

module "outofsync_sync_list" {
  source = "../../charts/outofsync_sync_list"
}

module "unknown_sync_list" {
  source = "../../charts/unknown_sync_list"
}

#dashboard resource
resource "signalfx_dashboard" "app_status_dashboard" {
  name = "ArgoCD App Status"
  description = "Dashboard highlighting the status of applications in ArgoCD including sync and health"
  dashboard_group = var.dashboard_group_id
  
  chart {
    chart_id = module.app_count.chart_id
    width   = 3
    height  = 1
    row     = 0
    column  = 0
  }
  chart {
    chart_id = module.repo_count.chart_id
    width   = 3
    height  = 1
    row     = 0
    column  = 3
  }
  chart {
    chart_id = module.highest_apps.chart_id
    width   = 6
    height  = 1
    row     = 0
    column  = 7
  }
  chart {
    chart_id = module.health_status.chart_id
    width   = 6
    height  = 1
    row     = 1
    column  = 0
  }
  chart {
    chart_id = module.degraded_health.chart_id
    width   = 2
    height  = 1
    row     = 1
    column  = 6
  }
  chart {
    chart_id = module.missing_health.chart_id
    width   = 2
    height  = 1
    row     = 1
    column  = 8
  }
  chart {
    chart_id = module.unknown_health.chart_id
    width   = 2
    height  = 1
    row     = 1
    column  = 11
  }
  chart {
    chart_id = module.sync_status.chart_id
    width   = 6
    height  = 1
    row     = 2
    column  = 0
  }
  chart {
    chart_id = module.out_of_sync.chart_id
    width   = 3
    height  = 1
    row     = 2
    column  = 6
  }
  chart {
    chart_id = module.unknown_sync.chart_id
    width   = 3
    height  = 1
    row     = 2
    column  = 10
  }

  chart {
    chart_id = module.degraded_health_list.chart_id
    width   = 4
    height  = 1
    row     = 3
    column  = 0
  }

  chart {
    chart_id = module.missing_health_list.chart_id
    width   = 4
    height  = 1
    row     = 3
    column  = 4
  }

  chart {
    chart_id = module.unknown_health_list.chart_id
    width   = 4
    height  = 1
    row     = 3
    column  = 9
  }
  chart {
    chart_id = module.outofsync_sync_list.chart_id
    width   = 6
    height  = 1
    row     = 4
    column  = 0
  }
  chart {
    chart_id = module.unknown_sync_list.chart_id
    width   = 6
    height  = 1
    row     = 4
    column  = 7
  }
}

