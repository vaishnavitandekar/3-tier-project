###### Create an EC2 Auto Scaling Group - web ######
resource "aws_autoscaling_group" "flipkart-web-asg" {
  name = "flipkart-web-asg"
  launch_template {
    id      = aws_launch_template.flipkart-web-template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.flipkart-pub-sub-1.id, aws_subnet.flipkart-pub-sub-2.id]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2
}

###### Create a Launch Template for the EC2 instances ######
resource "aws_launch_template" "flipkart-web-template" {
  name_prefix   = "flipkart-web-template"
  image_id      = "ami-0b982602dbb32c5bd"
  instance_type = "t3.micro"
  key_name      = "devopsbyvaishnavi"
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.flipkart-ec2-asg-sg.id]
  }
  user_data = base64encode(file("apache.sh"))
  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}
