# Define Subnet in Availability Zone 1
resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.prefix}-private-1"
  }
}

# Define Subnet in Availability Zone 2
resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.prefix}-private-2"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "${var.prefix}-main"
  }
}

# Define a security group for RDS
resource "aws_security_group" "rds_sg" {
  description = "Allow inbound traffic to RDS"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]  # Allow traffic from EC2 security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-rds_sg"
  }
}

# Define the RDS instance
resource "aws_db_instance" "postgres" {
  identifier              = "${var.prefix}-postgres-db"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.t3.micro"
  username                = "postgres_user"
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = "${var.prefix}-PostgresDB"
  }
}
