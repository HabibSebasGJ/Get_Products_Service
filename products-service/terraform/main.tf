terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 5.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region   = var.aws_region
}

# =======================
# Usar la tabla existente "Products" de DynamoDB
# =======================
data "aws_dynamodb_table" "products_table" {
  name = "Products"  # Nombre de la tabla ya existente
}

# Referencia a la tabla Products para usarla en otros recursos
output "products_table_name" {
  value = data.aws_dynamodb_table.products_table.name
}

output "products_table_arn" {
  value = data.aws_dynamodb_table.products_table.arn
}
