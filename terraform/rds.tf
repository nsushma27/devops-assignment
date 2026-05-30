resource "aws_db_subnet_group" "postgres" {

  name = "postgres-subnet-group"

  subnet_ids = [
    aws_subnet.private.id
  ]

  tags = {
    Name = "postgres-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {

  identifier = "devops-postgres"

  engine         = "postgres"
  engine_version = "16"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = "postgres"
  password = "ChangeMe123!"

  publicly_accessible = false

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.postgres.name
}
