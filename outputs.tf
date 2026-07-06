output "backup_container_storage_accounts" {
  description = "All backup_container_storage_account resources"
  value       = azurerm_backup_container_storage_account.backup_container_storage_accounts
}
output "backup_container_storage_accounts_recovery_vault_name" {
  description = "List of recovery_vault_name values across all backup_container_storage_accounts"
  value       = [for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : v.recovery_vault_name]
}
output "backup_container_storage_accounts_resource_group_name" {
  description = "List of resource_group_name values across all backup_container_storage_accounts"
  value       = [for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : v.resource_group_name]
}
output "backup_container_storage_accounts_storage_account_id" {
  description = "List of storage_account_id values across all backup_container_storage_accounts"
  value       = [for k, v in azurerm_backup_container_storage_account.backup_container_storage_accounts : v.storage_account_id]
}

