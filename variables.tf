
variable "yandex_token" {
  description = "Yandex token"
  default     = "y0_AgAAAAABXkX0AATuwQAAAAD-pGsYAAByzjr1m8NDUbj3SCqv4Dt5kePLMQ"
}

variable "yandex_zone" {
  description = "Zone"
  default = "ru-central1-a"
}

variable "yandex_folder_id" {
  description = "Yandex Folder ID to manage resources"
  default     = "b1g4ptsghrbbqkk8fqc7"
}

variable "num_nodes" {
  description = "Number of nodes to create"
  default = 1
}

variable "disk_size" {
  description = "Specifying disk size"
  default = 10
}

variable "boot_disk_image_id" {
  description = "Id of boot image"
  default = "fd85u0rct32prepgjlv0"
}

variable "private_key_path" {
  description = "Path to ssh private key, which would be used to access workers"
  default     = "~/.ssh/id_rsa"
}

variable "public_key_path" {
  description = "Path to ssh public key"
  default     = "~/.ssh/id_rsa.pub"
}