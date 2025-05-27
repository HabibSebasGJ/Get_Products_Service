resource "aws_lambda_function" "get_products" {
  function_name = "get_products"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = var.get_products_handler           
  runtime       = var.lambda_runtime                 
  filename      = var.get_products_zip               
  source_code_hash = filebase64sha256(var.get_products_zip)

  environment {
    variables = {
      PRODUCTS_TABLE = "Products"
      JWT_SECRET     = var.jwt_secret                
    }
  }

  depends_on = [aws_cloudwatch_log_group.get_products_log]
}
