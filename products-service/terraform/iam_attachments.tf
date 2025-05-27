# ============= ATTACH POLICY DE DYNAMODB A ROLE BASE =============
resource "aws_iam_role_policy_attachment" "products_lambda_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.products_lambda_policy.arn
}

# ============= CLOUDWATCH LOGS: PERMISOS PARA LOGS DE LAMBDA ============
resource "aws_iam_role_policy_attachment" "cloudwatch_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
