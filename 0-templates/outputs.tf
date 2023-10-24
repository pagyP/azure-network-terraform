
####################################################
# output files
####################################################

locals {
  output_values = templatefile("../../scripts/outputs/values.sh", {
    NODES = {
      hub1 = {
        VNET_NAME   = try(module.hub1.vnet.name, "")
        VNET_RANGES = try(join(", ", module.hub1.vnet.address_space), "")
        VM_NAME     = try(module.hub1_vm.vm.name, "")
        VM_IP       = try(module.hub1_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.hub1.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke1 = {
        VNET_NAME   = try(module.spoke1.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke1.vnet.address_space), "")
        VM_NAME     = try(module.spoke1_vm.vm.name, "")
        VM_IP       = try(module.spoke1_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke1.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke2 = {
        VNET_NAME   = try(module.spoke2.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke2.vnet.address_space), "")
        VM_NAME     = try(module.spoke2_vm.vm.name, "")
        VM_IP       = try(module.spoke2_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke2.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke3 = {
        VNET_NAME   = try(module.spoke3.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke3.vnet.address_space), "")
        VM_NAME     = try(module.spoke3_vm.vm.name, "")
        VM_IP       = try(module.spoke3_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke3.subnets : k => v.address_prefixes[0] }, "")
        APPS_URL    = try(module.spoke3_apps.url, "")
      }
      branch1 = {
        VNET_NAME   = try(module.branch1.vnet.name, "")
        VNET_RANGES = try(join(", ", module.branch1.vnet.address_space), "")
        VM_NAME     = try(module.branch1_vm.vm.name, "")
        VM_IP       = try(module.branch1_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.branch1.subnets : k => v.address_prefixes[0] }, "")
      }
      hub2 = {
        VNET_NAME   = try(module.hub2.vnet.name, "")
        VNET_RANGES = try(join(", ", module.hub2.vnet.address_space), "")
        VM_NAME     = try(module.hub2_vm.vm.name, "")
        VM_IP       = try(module.hub2_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.hub2.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke4 = {
        VNET_NAME   = try(module.spoke4.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke4.vnet.address_space), "")
        VM_NAME     = try(module.spoke4_vm.vm.name, "")
        VM_IP       = try(module.spoke4_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke4.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke5 = {
        VNET_NAME   = try(module.spoke5.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke5.vnet.address_space), "")
        VM_NAME     = try(module.spoke5_vm.vm.name, "")
        VM_IP       = try(module.spoke5_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke5.subnets : k => v.address_prefixes[0] }, "")
      }
      spoke6 = {
        VNET_NAME   = try(module.spoke6.vnet.name, "")
        VNET_RANGES = try(join(", ", module.spoke6.vnet.address_space), "")
        VM_NAME     = try(module.spoke6_vm.vm.name, "")
        VM_IP       = try(module.spoke6_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.spoke6.subnets : k => v.address_prefixes[0] }, "")
        APPS_URL    = try(module.spoke6_apps.url, "")
      }
      branch3 = {
        VNET_NAME   = try(module.branch3.vnet.name, "")
        VNET_RANGES = try(join(", ", module.branch3.vnet.address_space), "")
        VM_NAME     = try(module.branch3_vm.vm.name, "")
        VM_IP       = try(module.branch3_vm.vm.private_ip_address, "")
        SUBNETS     = try({ for k, v in module.branch3.subnets : k => v.address_prefixes[0] }, "")
      }
    }
  })

  output_files = {
    "output/values.txt" = local.output_values
  }
}

resource "local_file" "output_files" {
  for_each = local.output_files
  filename = each.key
  content  = each.value
}