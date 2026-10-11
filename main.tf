resource "oci_data_safe_security_policy_config" "data_safe_security_policy_configs" {
  for_each = var.data_safe_security_policy_configs

  compartment_id     = each.value.compartment_id
  security_policy_id = each.value.security_policy_id
  defined_tags       = each.value.defined_tags
  description        = each.value.description
  display_name       = each.value.display_name
  freeform_tags      = each.value.freeform_tags

  dynamic "firewall_config" {
    for_each = each.value.firewall_config != null ? [each.value.firewall_config] : []
    content {
      exclude_job              = firewall_config.value.exclude_job
      status                   = firewall_config.value.status
      violation_log_auto_purge = firewall_config.value.violation_log_auto_purge
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "unified_audit_policy_config" {
    for_each = each.value.unified_audit_policy_config != null ? [each.value.unified_audit_policy_config] : []
    content {
      exclude_datasafe_user = unified_audit_policy_config.value.exclude_datasafe_user
    }
  }
}

