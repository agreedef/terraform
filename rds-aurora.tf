resource "aws_rds_cluster_instance" "cluster_instances" {

  identifier = "aurora-mysql-instance"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class = "db.t2.small"
  engine = "aurora-mysql"
  engine_version = "5.7.mysql_aurora.2.03.2"
}

resource "aws_rds_cluster" "default" {

  cluster_identifier = "terraform-aurora"
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]
  database_name = "terraform"
  master_username = "admin"
  master_password = "123123123"
  db_subnet_group_name = "terraform_db_subnet_group"
  vpc_security_group_ids = [aws_security_group.terraform-db-sg.id]
  #db_cluster_parameter_group_name = "terraform-db-cluster-pg"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}
