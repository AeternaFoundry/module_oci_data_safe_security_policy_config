variable "data_safe_security_policy_configs" {
  description = <<EOT
Map of data_safe_security_policy_configs, attributes below
Required:
    - compartment_id
    - security_policy_id
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - firewall_config (block):
        - exclude_job (optional)
        - status (optional)
        - violation_log_auto_purge (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - unified_audit_policy_config (block):
        - exclude_datasafe_user (optional)
EOT

  type = map(object({
    compartment_id     = string
    security_policy_id = string
    defined_tags       = optional(map(string))
    description        = optional(string)
    display_name       = optional(string)
    freeform_tags      = optional(map(string))
    firewall_config = optional(object({
      exclude_job              = optional(string)
      status                   = optional(string)
      violation_log_auto_purge = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    unified_audit_policy_config = optional(object({
      exclude_datasafe_user = optional(string)
    }))
  }))
}

