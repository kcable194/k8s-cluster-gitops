variable "proxmox_host" {
  type    = string
  default = "pve.keatoncable.com"
}

variable "proxmox_token_id" {
  type = string
}

variable "proxmox_token_secret" {
  type      = string
  sensitive = true
}

variable "proxmox_tls_insecure" {
  type    = bool
  default = false
}

variable "nodes" {
  type = list(object({
    name         = string
    ip           = string
    mac_address  = string
    target_node  = string
    vm_storage   = string
  }))
  default = [
    { name = "talos-1", ip = "192.168.68.41", mac_address = "bc:24:11:00:00:01", target_node = "pve5", vm_storage = "local" },
    { name = "talos-2", ip = "192.168.68.42", mac_address = "bc:24:11:00:00:02", target_node = "pve2", vm_storage = "vm-storage" },
    { name = "talos-3", ip = "192.168.68.43", mac_address = "bc:24:11:00:00:03", target_node = "pve3", vm_storage = "vm-storage" }
  ]
}

variable "gateway" {
  type    = string
  default = "192.168.68.1"
}

variable "cidr" {
  type    = string
  default = "24"
}

variable "nameservers" {
  type    = string
  default = "192.168.68.1 1.1.1.1"
}

variable "talos_iso" {
  type    = string
  default = "local:iso/talos-v1.11.6-nocloud-amd64.iso"
}
