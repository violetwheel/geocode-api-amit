resource "aws_dynamodb_table" "dynamodb_geocoding_table" {
  name             = "GeoCodeAPI"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  hash_key         = "LocationID"

  attribute {
    name = "LocationID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-test-table"
    Environment = "dev"
  }
}

resource "aws_iam_role" "iam_for_lambda_dynamo" {
  name = "iam_for_lambda_dynamo"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dynamodb_lambda_policy" {
  name   = "lambda-dynamodb-policy"
  role   = aws_iam_role.iam_for_lambda_dynamo.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "AllowLambdaFunctionToCreateLogs",
        "Action": [
            "logs:*"
        ],
        "Effect": "Allow",
        "Resource": [
            "arn:aws:logs:*:*:*"
        ]
    },
    {
        "Sid": "AllowLambdaFunctionInvocation",
        "Effect": "Allow",
        "Action": [
            "lambda:InvokeFunction"
        ],
        "Resource": [
            "${aws_dynamodb_table.dynamodb_geocoding_table.arn}/stream/*"
        ]
    },
    {
        "Sid": "APIAccessForDynamoDBStreams",
        "Effect": "Allow",
        "Action": [
            "dynamodb:GetRecords",
            "dynamodb:GetShardIterator",
            "dynamodb:DescribeStream",
            "dynamodb:ListStreams"
        ],
        "Resource": "${aws_dynamodb_table.dynamodb_geocoding_table.arn}/stream/*"
    }
  ]
}
EOF
}

output "dynamodb_geocoding_table" {
  value       = aws_dynamodb_table.dynamodb_geocoding_table.arn
  description = "The ARN of the DynamoDB table"
}

output "lambda_processing_arn" {
  value       = aws_lambda_function.lambda.arn
  description = "The ARN of the Lambda function processing the DynamoDB stream"
}
