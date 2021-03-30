/* security group for RDS */
resource "aws_security_group" "cs-rds-sg" {
  description = "RDS security group for cs"
  name        = "cs-rds-sg"
  vpc_id      = aws_vpc.cs-vpc.id
}

/* security group for RDS */
resource "aws_security_group_rule" "cs-rds-sg-rule1" {
  description       = "cs-rds-sg-rule1"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.cs-rds-sg.id
}
resource "aws_security_group_rule" "cs-rds-sg-rule2" {
  description       = "cs-rds-sg-rule2"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cs-rds-sg.id
}
resource "aws_security_group_rule" "cs-rds-sg-rule3" {
  description       = "cs-rds-sg-rule3"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.cs-rds-sg.id
}
resource "aws_security_group_rule" "cs-rds-sg-rule4" {
  description       = "cs-rds-sg-rule4"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.cs-alb-sg.id
  security_group_id        = aws_security_group.cs-rds-sg.id
}

