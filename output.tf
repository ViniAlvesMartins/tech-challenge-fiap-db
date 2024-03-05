output "db_endpoint" {
  value = aws_db_instance.zeburguer_db.endpoint
}

output "db_port" {
  value = aws_db_instance.zeburguer_db.port
}

output "db_username" {
  value = aws_db_instance.zeburguer_db.username
}

output "db_password_secret_name" {
  value = aws_secretsmanager_secret.ze_burguer_db_password.arn
}