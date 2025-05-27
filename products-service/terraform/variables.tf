# Región AWS
variable "aws_region" {
  description = "Región de AWS"
  default     = "us-west-1"
}

# =======================
# LAMBDA - PRODUCTOS
# =======================
variable "products_lambda_name" {
  default     = "products-get-lambda"
}

variable "get_products_zip" {
  default = "../src/getProd.zip"
}

variable "get_products_handler" {
  default = "index.handler" 
}

variable "jwt_secret" {
  description = "JWT secret key for token validation"
  type        = string
}


variable "products_api_path" {
  default     = "productos/{proxy+}"
}

# =======================
# API Gateway Stage
# =======================
variable "api_env_stage_name" {
  default     = "dev"
}

# =======================
# Runtime para Lambdas (Node.js 22)
# =======================
variable "lambda_runtime" {
  default     = "nodejs22.x"
}
