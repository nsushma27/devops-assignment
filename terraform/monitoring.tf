resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/devops-assignment/application"
  retention_in_days = 7
}

resource "aws_cloudwatch_dashboard" "infrastructure" {

  dashboard_name = "infrastructure-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization"]
          ]

          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "EC2 CPU Utilization"
        }
      }
    ]

  })
}

resource "aws_cloudwatch_dashboard" "application" {

  dashboard_name = "application-health-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ApplicationELB", "RequestCount"]
          ]

          period = 300
          stat   = "Sum"
          region = "us-east-1"
          title  = "Application Request Count"
        }
      }
    ]

  })
}
