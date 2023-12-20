# tf-ec2-aws
tf repository to create ec2 instance with aws 
This repo will provision ec2 instance with ubuntu base image in us-east-1 region in default vpc

# command to configure aws instance
export AWS_ACCESS_KEY_ID="<yourkey>"

export AWS_SECRET_ACCESS_KEY="<yoursecretkey>"

aws configure --> provide your access key and secret key
# commands to provision

terraform init 

terraform apply 
