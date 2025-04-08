resource "aws_ecs_cluster" "delta-ecs-cluster" {
  name = "delta-ecs"

}

resource "aws_ecs_task_definition" "delta-ecs-td" {
  family                   = "delta-ecs-td"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "delta-ecs"
      image     = "service-first"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "delta-ecs-service" {
  name            = "delta-ecs-service"
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.delta-ecs-td.arn
  cluster         = aws_ecs_cluster.delta-ecs-cluster.id

  network_configuration {
    subnets          = [] # subnet ids 
    security_groups  = [] # security group ids
    assign_public_ip = true
  }

  deployment_controller {
    type = "ECS"
  }

  #   load_balancer {

  #   }

}
