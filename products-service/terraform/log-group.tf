resource "aws_cloudwatch_log_group" "get_products_log" {
  name              = "/aws/lambda/get_products"
  retention_in_days = 14

  tags = {
    Environment = "dev"
    Service     = "product-service"
  }
}
