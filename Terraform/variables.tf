
variable "yandex_token" {
  description = "Yandex token"
  default     = "y0_AgAAAAABXkX0AATuwQAAAAD-pGsYAAByzjr1m8NDUbj3SCqv4Dt5kePLMQ"
}

variable "yandex_zone" {
  description = "Zone points to ru-central1 in Yandex Cloud"
  default = "ru-central1-a"
}

variable "yandex_folder_id" {
  description = "Yandex Folder ID to manage resources"
  default     = "b1g4ptsghrbbqkk8fqc7"
}

variable "num_nodes" {
  description = "Number of vrtual nodes to create"
  default = 1
}

variable "boot_disk_image_id" {
  description = "Id of boot image Ubuntu 18.04"
  default = "fd8aeg00ca1t9obj3irl"
}

variable "disk_size" {
  description = "Specifying the size of disk (Gb)"
  default = 15
}

variable "private_key_path" {
  description = "Path to ssh private key"
  default     = "~/.ssh/id_rsa"
}

variable "public_key_path" {
  description = "Path to ssh public key"
  default     = "~/.ssh/id_rsa.pub"
}