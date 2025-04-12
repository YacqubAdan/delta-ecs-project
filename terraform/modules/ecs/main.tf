resource "aws_ecs_cluster" "delta-ecs-cluster" {
  name = var.ecs_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "delta-ecs-td" {
  family                   = var.ecs_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.exec_role.arn
  task_role_arn            = aws_iam_role.exec_role.arn


  container_definitions = jsonencode([
    {
      name  = var.ecs_name
      image = var.container_img
      cpu   = 0
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
    }
  ])

  tags = {
    Name = var.ecs_family
  }
}

resource "aws_ecs_service" "delta-ecs-service" {
  name            = var.service_name
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.delta-ecs-td.id
  cluster         = aws_ecs_cluster.delta-ecs-cluster.arn
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.subnet_ids  # subnet ids 
    security_groups  = [var.ecs_sg_id] # security group ids
    assign_public_ip = true
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = var.tg_arn
    container_name   = var.ecs_name
    container_port   = var.container_port
  }
  depends_on = [var.http_listen_id]
}


resource "aws_iam_role" "exec_role" {
  name = var.exec_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "exec_policy" {
  role       = aws_iam_role.exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}