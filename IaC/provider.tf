provider "aws" {}

provider "local" {}

resource "local_file" "db_info" {
  content = <<EOF
Instance URL: ${aws_instance.ihp-app.public_dns}
DB Endpoint: ${aws_db_instance.postgres.address}
DB Username: ${aws_db_instance.postgres.username}
DB Password: ${aws_db_instance.postgres.password}
EOF

  filename = "${path.module}/db_info.txt"
}
