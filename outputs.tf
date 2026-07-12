output "backup_container_storage_accounts_id" {
  description = "Map of id values across all backup_container_storage_accounts, keyed the same as var.backup_container_storage_accounts"
  value       = { for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : k => v.id }
}
output "backup_container_storage_accounts_recovery_vault_name" {
  description = "Map of recovery_vault_name values across all backup_container_storage_accounts, keyed the same as var.backup_container_storage_accounts"
  value       = { for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : k => v.recovery_vault_name }
}
output "backup_container_storage_accounts_resource_group_name" {
  description = "Map of resource_group_name values across all backup_container_storage_accounts, keyed the same as var.backup_container_storage_accounts"
  value       = { for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : k => v.resource_group_name }
}
output "backup_container_storage_accounts_storage_account_id" {
  description = "Map of storage_account_id values across all backup_container_storage_accounts, keyed the same as var.backup_container_storage_accounts"
  value       = { for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : k => v.storage_account_id }
}

