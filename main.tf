locals {
  container_name = "dynamo-local"
  dynamo_port    = 7090
}

provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "us-east-1"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = local.dynamo_port
  }
}

resource "docker_image" "dynamodb" {
  name = "instructure/dynamo-local-admin"
}

resource "docker_container" "dynamodb" {
  name  = local.container_name
  image = docker_image.dynamodb.latest
  ports {
    internal = 8000
    external = local.dynamo_port
  }
}

resource "aws_dynamodb_table" "example_table" {
  name         = "example_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
  depends_on = [docker_container.dynamodb]
}
