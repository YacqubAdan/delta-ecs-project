output "exec_policy_arn" {
  value       = aws_iam_role.exec_role.arn
  description = "The ARN of the ecs execution role"
}

output "exec_policy_name" {
  value       = aws_iam_role.exec_role.name
  description = "The name of the ecs execution role"
}

output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
  value       = aws_ecs_cluster.delta-ecs-cluster.id
}

output "ecs_service_id" {
  description = "The ID of the ECS Service"
  value       = aws_ecs_service.delta-ecs-service.id
}