resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group_rds"
  subnet_ids = ["subnet-063e56bb28d5750f7", "subnet-0e7cf64a4ce1aeb12"]  # Substitua pelos IDs das subnets onde o RDS deve ser criado
}

resource "aws_secretsmanager_secret" "ze_burguer_db_password" {
  name = "ze_burguer_db"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "example_db_password_version" {
  secret_id     = aws_secretsmanager_secret.ze_burguer_db_password.id
  secret_string = random_password.password.result
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_instance" "zeburguer_db" {
  identifier            = "zeburger-db"
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "postgres"
  engine_version        = "14"
  instance_class        = "db.t4g.micro"
  db_name               = "zeburguer"
  username              = "zeburguer"
  password              = random_password.password.result
  db_subnet_group_name  = aws_db_subnet_group.subnet_group.name
  final_snapshot_identifier = "false"
  skip_final_snapshot = true

  tags = {
    Name = "zeburger-db"
  }
}
