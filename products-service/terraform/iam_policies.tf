resource "aws_iam_policy" "products_lambda_policy" {
  name        = "products-lambda-dynamodb-policy"
  description = "Permite leer todos los productos de la tabla DynamoDB 'Products' y escribir logs en CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:Scan",       
          "dynamodb:GetItem"     
        ],
        Resource = "arn:aws:dynamodb:${var.aws_region}:*:table/Products"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}
