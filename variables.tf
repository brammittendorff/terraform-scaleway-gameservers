variable "server_count" {
  type    = string
  default = "3"
}

variable "server_name" {
  type    = string
  default = "game-server"
}

variable "server_image" {
  type    = string
  default = "ubuntu_focal"
  validation {
    condition     = can(regex("^(debian_|ubuntu_).*$", var.server_image))
    error_message = "The server_image value must start with ubuntu_ or debian_ (ubuntu_focal, debian_buster, ...)."
  }
}

variable "server_type" {
  type    = string
  default = "DEV1-S"
  validation {
    condition     = can(regex("^(DEV1-(S|M|L|XL))|(GP1-(XS|S|M|L|XL))$", var.server_type))
    error_message = "The server_type value must be a valid Scaleway instance type (DEV1-S, DEV1-M, DEV1-L, DEV1-XL, GP1-XS, GP1-S, GP1-M, GP1-L, GP1-XL)."
  }
}

variable "username" {
  type    = string
  default = "devops"
}

variable "game_password" {
  type        = string
  sensitive   = true
}