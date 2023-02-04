provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_db_snapshot" "db_snapshot" {
  most_recent            = true
  db_instance_identifier = var.db_instance_to_clone
}


#Create RDS instance from snapshot
resource "aws_db_instance" "mysql_instance" {
  engine                    = var.engine
  engine_version            = var.engine_version
  identifier                = "${var.app_name}-sample"
  snapshot_identifier       = data.aws_db_snapshot.db_snapshot.id
  instance_class            = var.instance_class
  vpc_security_group_ids    = ["${var.security_group_id}"]
  skip_final_snapshot       = true
  final_snapshot_identifier = "${aws_db_instance.mysql_instance} - snapshot"
  parameter_group_name      = var.parameter_group_name
  db_subnet_group_name      = var.subnet_group_name
  timeouts {
    create = "2h"
  }
}