variable "instance_name" {
  default = "default-instance"
}
variable "instance_count" {
  default = "1"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "ami_id" {}
variable "subnet_id" {}
variable "role_name" {}
variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
variable "policy_arn2" {
  default = "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation"
}
variable "profile_name" {
  default = "SSM_Role"
}

variable "region" {
  default = "us-east-1"
}
