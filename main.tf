module "mwaa_iam_role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.16.2"

  enabled = local.iam_role_enabled
  principals = {
    "Service" = [
      "airflow-env.amazonaws.com",
      "airflow.amazonaws.com"
    ]
  }

  use_fullname = true

  policy_documents = [
    data.aws_iam_policy_document.this.json,
  ]

  policy_document_count = 1
  policy_description    = "AWS MWAA IAM policy"
  role_description      = "AWS MWAA IAM role"

  context = module.iam_label.context
}
