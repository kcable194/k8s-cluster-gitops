proxmox_host           = "pve.keatoncable.com"
proxmox_token_id       = "terraform-prov@pve!terraform"
proxmox_token_secret   = "8bedd6d3-643a-4754-8ff7-7a9e3f66767b"
proxmox_tls_insecure   = false

nodes = [
    { name = "talos-1", ip = "192.168.68.41", mac_address = "bc:24:11:00:00:01", target_node = "pve5", vm_storage = "local" },
    { name = "talos-2", ip = "192.168.68.42", mac_address = "bc:24:11:00:00:02", target_node = "pve2", vm_storage = "vm-storage" },
    { name = "talos-3", ip = "192.168.68.43", mac_address = "bc:24:11:00:00:03", target_node = "pve3", vm_storage = "vm-storage" }
]

gateway     = "192.168.68.1"
cidr        = "24"
nameservers = "192.168.68.1 1.1.1.1"

# You'll need to upload the Talos ISO first
talos_iso  = "local:iso/talos-v1.11.6-nocloud-amd64.iso"