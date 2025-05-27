resource "aws_apigatewayv2_api" "product_api" {
  name          = "product-api"
  protocol_type = "HTTP"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_apigatewayv2_integration" "product_integration" {
  api_id                 = aws_apigatewayv2_api.product_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.get_products.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "product_route" {
  api_id    = aws_apigatewayv2_api.product_api.id
  route_key = "GET /products"
  target    = "integrations/${aws_apigatewayv2_integration.product_integration.id}"
  
}


resource "aws_lambda_permission" "apigw_lambda_get_products" {
  statement_id  = "AllowExecutionFromAPIGatewayGetProducts"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_products.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.product_api.execution_arn}/*/*"
}

output "products_api_url" {
  value = "https://${aws_apigatewayv2_api.product_api.api_endpoint}/products"
}
