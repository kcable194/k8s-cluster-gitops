resource "proxmox_vm_qemu" "talos" {
  for_each = { for idx, node in var.nodes : node.name => node }

  name        = each.key
  target_node = each.value.target_node
  vmid        = each.value.vmid

  # VM specs
  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }
  memory  = each.value.memory
  machine = "q35"
  scsihw  = "virtio-scsi-pci"

  # BIOS/boot settings
  bios  = "seabios"
  boot  = "order=scsi0;ide2"
  agent = 0 # Set to 1 after Talos is bootstrapped with qemu-guest-agent extension

  # Disk
  disks {
    scsi {
      scsi0 {
        disk {
          storage = each.value.vm_storage
          size    = "64G"
          discard = true
        }
      }
    }
    ide {
      ide2 {
        cdrom {
          iso = var.talos_iso
        }
      }
    }
  }

  # Network with static IP
  network {
    id      = 0
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = each.value.mac_address
  }

  ipconfig0 = "ip=${each.value.ip}/${var.cidr},gw=${var.gateway}"

  nameserver = var.nameservers

  # Cloud-init settings
  os_type = "cloud-init"
  ciuser  = "root"

  # Start on boot
  onboot = true

  lifecycle {
    ignore_changes = [
      network,
      disks,
    ]
  }
}