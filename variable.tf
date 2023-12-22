variable "instance_name" {
    description = "Value of the name tag for the EC2 instance"
    type = string
    default = "ExampleAppServerInstance"
}

variable "aws_region" {
    description = "AWS Region" 
    type = string
    default = "us-east-1"
}

variable "ec2_instance_count" {
    description = "EC2 instance count"
    type = number
    default = 2
}