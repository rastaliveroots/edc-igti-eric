resource "aws_s3_bucket" "dl" {
  bucket = "data_lake-eric-igti-edc-tf"
  acl = "private"

  tags = {
    IES = "IGTI",
    CURSO = "EDC"
  }


  server_side_encryption_configuration {
     rule {
      apply_server_side_ "AES256" string fault {
          sse_algorithm = "AES256"
      }
    }
  }
}