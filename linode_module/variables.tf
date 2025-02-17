variable "image" {
  description = "Image to use for the Linode instance"
  type        = string
  default     = "linode/debian12"
}

variable "label" {
  description = "Label for the Linode instance"
  type        = string
}

variable "region" {
  description = "Region for the Linode instance"
  type        = string
  default     = "eu-central"
}

variable "type" {
  description = "Type of the Linode instance"
  type        = string
  default     = "g6-nanode-1"
}

variable "public_key_content" {
  description = "Content of the public SSH key"
  type        = string
}

variable "linode_root_password" {
  description = "Root password for the Linode instance"
  type        = string
}

variable "ansible_hosts_file_path" {
  description = "Path to the Ansible hosts file"
  type        = string
}

variable "ansible_hosts_group_name" {
  description = "Name of the desired Ansible host group"
  type        = string
}

variable "ansible_host_name" {
  description = "Name of the Ansible host"
  type        = string
}

variable "ansible_ssh_private_key_path" {
  description = "Path of the SSH private key"
  type        = string
}
