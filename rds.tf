/*
# rds resource
1. rds tf resource 
2. security group
    - 3306
         - security-grp => tf_ec2_sg (allow from ec2 instance)
         - cidr_block => ["local ip"]
3. outputs
*/

resource "aws_db_instance" "tf_rds_instance" {
  allocated_storage      = 10
  db_name                = "kunal_demo"
  identifier             = "nodejs-rds-mysql"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "Kunal_1234"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.tf_rds_sg.id]
}

resource "aws_security_group" "tf_rds_sg" {
  vpc_id      = "vpc-04307de61fba513aa" # default VPC
  name        = "allow_mysql"
  description = "Allow MySQL traffic"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["102.89.47.238/32"]              # local IP address
    security_groups = [aws_security_group.tf_ec2_sg.id] # Allow traffic from EC2 security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

# local variables
locals {
  rds_endpoint = element(split(":", aws_db_instance.tf_rds_instance.endpoint), 0)
}

# outputs
output "rds_instance_endpoint" {
  value = local.rds_endpoint
}
output "rds_db_name" {
  value = aws_db_instance.tf_rds_instance.db_name
}
output "rds_username" {
  value = aws_db_instance.tf_rds_instance.username
}
output "rds_pass" {
  value     = aws_db_instance.tf_rds_instance.password
  sensitive = true
}
