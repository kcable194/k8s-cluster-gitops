proxmox_host     = "pve.keatoncable.com"
proxmox_token_id = "terraform-prov@pve!terraform"
# IMPORTANT: Move proxmox_token_secret to env var TF_VAR_proxmox_token_secret
# proxmox_token_secret is set via environment variable
proxmox_tls_insecure = false

nodes = [
  { name = "talos-2", ip = "192.168.68.42", mac_address = "bc:24:11:00:00:02", target_node = "pve2", vm_storage = "local", vmid = 201, memory = 14336 },
  { name = "talos-3", ip = "192.168.68.43", mac_address = "bc:24:11:00:00:03", target_node = "pve3", vm_storage = "local", vmid = 202, memory = 20480 },
  { name = "talos-4", ip = "192.168.68.44", mac_address = "bc:24:11:00:00:04", target_node = "pve4", vm_storage = "local", vmid = 203, memory = 14336 }
]

gateway     = "192.168.68.1"
cidr        = "24"
nameservers = "192.168.68.1 1.1.1.1"

# You'll need to upload the Talos ISO first
# Download SecureBoot ISO from factory.talos.dev with your schematic (iscsi-tools + util-linux-tools)
talos_iso = "local:iso/talos-v1.12.6-nocloud-amd64.iso"