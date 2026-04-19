variable "project" {
    type = string
    default = "roboshop"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "sg_names" {
    type = list
    default = [
        # Database SGs
        "mongodb", "mysql", "redis", "rabbitmq", 
         "ingress_alb",
        "bastion", "openvpn",
        "eks_control_plane", "eks_worker_nodes"
        ]
  
}