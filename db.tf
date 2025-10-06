#### RDS ####
resource "aws_db_subnet_group" "flipkart-db-sub-grp" {
  name       = "flipkart-db-sub-grp"
  subnet_ids = ["${aws_subnet.flipkart-pvt-sub-3.id}","${aws_subnet.flipkart-pvt-sub-4.id}"]
}

resource "aws_db_instance" "flipkart-db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0.41"
  instance_class              = "db.t3.micro"
  identifier                  = "flipkart-db"
  username                    = "admin"
  password                    = "Devopsbyvaishnavi009*"
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.flipkart-db-sub-grp.name
  vpc_security_group_ids      = ["${aws_security_group.flipkart-db-sg.id}"]
  multi_az                    = true
  skip_final_snapshot         = true
  publicly_accessible          = false

  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}


