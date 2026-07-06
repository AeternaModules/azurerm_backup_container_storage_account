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
  # --- Unconfirmed validation candidates, derived from azurerm_backup_container_storage_account's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: recovery_vault_name
  #   source:    validate.RecoveryServicesVaultName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: storage_account_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: storage_account_id
  #   source:    [from azure.ValidateResourceID] err != nil
}

