resource "databricks_job" "new_job" {
    format                    = "MULTI_TASK"
    max_concurrent_runs       = 1
    max_retries               = 0
    min_retry_interval_millis = 0
    name                      = "cdl-poc-terraform"
    retry_on_timeout          = false
    timeout_seconds           = 0

    email_notifications {
        alert_on_last_attempt     = false
        no_alert_for_skipped_runs = false
        on_failure                = []
        on_start                  = []
        on_success                = []
    }

    git_source {
        branch   = "branch"
        provider = "awsCodeCommit"
        url      = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/vertex-cdl-lambda-new-repo"
    }

    task {
        existing_cluster_id       = "0207-110440-flg8koe8"
        max_retries               = 0
        min_retry_interval_millis = 0
        retry_on_timeout          = false
        task_key                  = "cdl-poc-1"
        timeout_seconds           = 0

        email_notifications {
            alert_on_last_attempt     = false
            no_alert_for_skipped_runs = false
            on_failure                = []
            on_start                  = []
            on_success                = []
        }

        spark_python_task {
            parameters  = []
            python_file = "/Repos/rajiv.singh@tothenew.com/vertex-cdl-lambda-new-repo/app.py"
        }
    }
    task {
        existing_cluster_id       = "0207-110440-flg8koe8"
        max_retries               = 0
        min_retry_interval_millis = 0
        retry_on_timeout          = false
        task_key                  = "cdl-poc-2"
        timeout_seconds           = 0

        email_notifications {
            alert_on_last_attempt     = false
            no_alert_for_skipped_runs = false
            on_failure                = []
            on_start                  = []
            on_success                = []
        }

        spark_python_task {
            parameters  = []
            python_file = "/Repos/rajiv.singh@tothenew.com/vertex-cdl-lambda-new-repo/cdk_lambda/cdk_lambda_stack.py"
        }
    }
    task {
        existing_cluster_id       = "0207-110440-flg8koe8"
        max_retries               = 0
        min_retry_interval_millis = 0
        retry_on_timeout          = false
        task_key                  = "cdl-poc-4"
        timeout_seconds           = 0

        depends_on {
            task_key = "cdl-poc-2"
        }

        email_notifications {
            alert_on_last_attempt     = false
            no_alert_for_skipped_runs = false
            on_failure                = []
            on_start                  = []
            on_success                = []
        }

        spark_python_task {
            parameters  = []
            python_file = "/Repos/rajiv.singh@tothenew.com/vertex-cdl-lambda-new-repo/cdk_lambda/cdk_lambda_stack.py"
        }
    }

    timeouts {}

    webhook_notifications {
    }
}
