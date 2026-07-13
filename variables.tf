variable "backup_container_storage_accounts" {
  description = <<EOT
Map of backup_container_storage_accounts, attributes below
Required:
    - recovery_vault_name
    - resource_group_name
    - storage_account_id
EOT

  type = map(object({
    recovery_vault_name = string
    resource_group_name = string
    storage_account_id  = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.backup_container_storage_accounts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.backup_container_storage_accounts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.backup_container_storage_accounts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

