resource "aws_db_parameter_group" "parameter_group" {
  name = "terraform-db-pg"
  family = "aurora-mysql5.7"
  description = "Terraform Parameter Group"

  parameter {
    name = "slow_query_log"
    value = "1"
  }

  parameter {
    name = "long_query_time"
    value = "1"
  }

  parameter {
    name = "connect_timeout"
    value = "5"
  }

  parameter {
    name = "max_connections"
    value = "16000"
  }

  parameter {
    name = "performance_schema"
    value = 0
    apply_method = "pending-reboot" #Changes applied when DB is rebooted
  }

  tags = {
    Name = "terraform-db-pg"
  }
}

resource "aws_rds_cluster_parameter_group" "cluster_parameter_group" {
  name = "terraform-db-cluster-pg"
  family = "aurora-mysql5.7"
  description = "Terraform Cluster Parameter Group"

  parameter {
    name = "time_zone"
    value = "asia/seoul"
  }

  parameter {
    name = "slow_query_log"
    value = "1"
  }

  parameter {
    name = "long_query_time"
    value = "1"
  }

  parameter {
    name = "collation_server"
    value = "utf8mb4_bin"
  }

  parameter {
    name = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name = "collation_connection"
    value = "utf8mb4_bin"
  }

  parameter {
    name = "character_set_filesystem"
    value = "utf8mb4"
  }

  parameter {
    name = "character_set_results"
    value = "utf8mb4"
  }

  parameter {
    name = "max_connections"
    value = "16000"
  }

  parameter {
    apply_method = "pending-reboot"
    name = "performance_schema"
    value = "0"
  }

  parameter {
    apply_method = "pending-reboot"
    name = "query_cache_type"
    value = "0"
  }

  parameter {
    apply_method = "immediate"
    name = "max_connect_errors"
    value = "999999"
  }

  parameter {
    apply_method = "immediate"
    name = "server_audit_logging"
    value = "1"
  }

  tags = {
    Name = "Terraform-db-cluster-pg"
  }
}
