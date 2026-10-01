output "app_url" {
  value = "http://${aws_lb.app.dns_name}"
}

output "ecs_cluster" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service" {
  value = aws_ecs_service.app.name
}

output "github_deploy_role_arn" {
  value = aws_iam_role.github_deploy.arn
}