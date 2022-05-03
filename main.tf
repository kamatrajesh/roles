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
