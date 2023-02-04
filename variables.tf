# variables to declare for connecting to the AWS
variable "region" {}
variable "access_key" {}
variable "secret_key" {}

# variable to declare the db_instance to clone
variable "db_instance_to_clone" {}

# variable to declare for creating as rds instance
variable "engine" {}
variable "engine_version" {}
variable "app_name" {}
variable "instance_class" {}
variable "parameter_group_name" {}
variable "security_group_id" {}
variable "subnet_group_name" {}