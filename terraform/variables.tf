variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "private_key" {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "vm_count" {
  description = "Default count of vm"
  type        = number
  default     = 1
}
