# main.tf

provider "aws" {
  region = "eu-west-2"  # Replace this with your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "ebunlomo-bucket"  # Replace this with a globally unique bucket name

  # Uncomment the line below if you want to enable versioning on the bucket
  # versioning {
  #   enabled = true
  # }
}

# Optionally, you can add any additional configurations or resources as needed.