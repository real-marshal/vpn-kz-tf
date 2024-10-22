variable "api_key" {
  type = string
}

variable "ssh_pubkey_path" {
  type = string
}

variable "ssh_key_path" {
  type = string
}

variable "server_bandwidth" {
  type = number
  default = 100
}