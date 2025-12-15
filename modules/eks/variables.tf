variable "env" {
  type = string
  default = "dev"
}

variable "private_subnets" {
  type = list(string) 
}

variable "vpc_id" {
  type = string
}