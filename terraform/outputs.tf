output "nodes" {
  value = {
    for vm in proxmox_vm_qemu.talos :
    vm.name => {
      ip   = split("/", vm.ipconfig0)[0]
      node = vm.target_node
      vmid = vm.vmid
    }
  }
}

output "next_steps" {
  value = <<-EOT
    VMs created! Bootstrap steps:

    1. Generate Talos configs:
       talosctl gen config talos-cluster https://${var.nodes[0].ip}:6443

    2. Apply configs to all nodes:
       talosctl apply-config --insecure -n ${var.nodes[0].ip} -f controlplane.yaml
       talosctl apply-config --insecure -n ${var.nodes[1].ip} -f controlplane.yaml
       talosctl apply-config --insecure -n ${var.nodes[2].ip} -f controlplane.yaml

    3. Bootstrap (after ~2 min):
       talosctl bootstrap -n ${var.nodes[0].ip}

    4. Get kubeconfig:
       talosctl kubeconfig -n ${var.nodes[0].ip}

    5. Verify:
       kubectl get nodes
  EOT
}