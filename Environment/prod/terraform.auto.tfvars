infra_rg_for_each = {
  rg1 = {
    name     = "To-Do-Rg1"
    location = "japaneast"
  }
  rg2 = {
    name     = "To-Do-Rg2"
    location = "centralindia"
    
  }
}

infra_vnet_for_each = {
  vnet1 = {
    name          = "vnet1"
    address_space = ["10.0.0.0/16"]
  }
}

infra_subnet_for_each = {
  subnet1 = {
    name             = "to-do-front-end"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "to-do-back-end"
    address_prefixes = ["10.0.2.0/24"]
  }
}

infra_nic_for_each = {
  nic1 = {
    nic_name = "to-do-nic1"
    pip_name = "to-do-pip1"
  }
  nic2 = {
    nic_name = "to-do-nic2"
    pip_name = "to-do-pip2"
  }
}
infra_vm_for_each = {
  vm1 = {
    name = "todo-front-end"
  }
  vm2 = {
    name = "todo-back-end"
  }
}
infra_public_ip = {
  pip1 = {
    name = "front-end-pip"
  }
  pip2 = {
    name = "back-end-pip"
  }
}
infra_key_vault = {
  vault1 = {
    name                       = "key-vault"
    sku                        = "standard"
    soft_delete_retention_days = 7
  }
}
infra_vault_secret = {
  secret1 = {
    name  = "viveksecret"
    value = "Admin@12345"
  }
  sqlSecret = {
    name  = "todosqladmin"
    value = "SqlAdmin@123"
  }
}
infra_mssql_server = {
  server1 = {
    name                = "todo-sql-server001"
    version             = "12.0"
    minimum_tls_version = "1.2"
  }
}
infra_database = {
  db1 = {
    name         = "todo-db"
    version      = "12.0"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
  }
}
