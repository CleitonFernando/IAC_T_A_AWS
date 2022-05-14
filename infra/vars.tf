variable amis {
  type        = map
  default     =     {
      "us-east-1" = "ami-04505e74c0741db8d"
  }
}

variable "cdirs_acesso_remoto" {
  type        = list
  default     = ["clignet.ddns.net"]
  description = "liberar ip de acesso"
}

variable key_name {
  default     = "IAC-DEV"
  description = "IAC-DEV"
}

variable t2 {
  default     = "t2.micro"
  description = "maquina free aws"
}



