terraform {
    required_providers {
      signalfx = {
        source  = "splunk-terraform/signalfx"
        version = "6.7.10"
      }
    }
  }
  
  provider "signalfx" {
    auth_token = var.signalfx_auth_token
    api_url    = var.signalfx_api_url
  }
  