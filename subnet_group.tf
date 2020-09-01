resource "aws_db_subnet_group" "subnet_group" {
  name = "terraform_db_subnet_group"
  description = "terraform_db_subnet_group"
  subnet_ids = [aws_subnet.terraform-db-sub-2a.id, aws_subnet.terraform-db-sub-2c.id] 

  tags = {
    name = "terraform_db_subnet_group"
  }
}
