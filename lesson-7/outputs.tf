output "s3_bucket_name" {
  value = module.s3_backend.s3_bucket_name
}

output "dynamodb_table_name" {
  value = module.s3_backend.dynamodb_table_name
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "rds_db_name" {
  value = module.rds.db_name
}
