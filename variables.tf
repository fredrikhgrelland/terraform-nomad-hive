# Nomad
variable "nomad_datacenters" {
  type        = list(string)
  description = "Nomad data centers"
  default     = ["dc1"]
}
variable "nomad_namespace" {
  type        = string
  description = "[Enterprise] Nomad namespace"
  default     = "default"
}

variable "local_docker_image" {
  type        = bool
  description = "Switch for nomad jobs to use artifact for image lookup"
  default     = false
}

# Hive
variable "use_canary" {
  type        = bool
  description = "Uses canary deployment for Hive"
  default     = false
}

variable "hive_service_name" {
  type        = string
  description = "Hive service name"
  default     = "hive-metastore"
}

variable "consul_docker_image" {
  type        = string
  description = "Consul docker image"
  default     = "consul:1.9"
}

variable "hive_container_port" {
  type        = number
  description = "Hive port"
  default     = 9083
}
variable "hive_docker_image" {
  type        = string
  description = "Hive docker image"
  default     = "fredrikhgrelland/hive:3.1.0"
}

variable "hive_container_environment_variables" {
  type        = list(string)
  description = "Hive environment variables"
  default     = [""]
}

variable "hive_bucket" {
  type = object({
    default = string,
    hive    = string
  })
  description = "Hive requires minio buckets"
}

variable "resource" {
  type = object({
    cpu    = number,
    memory = number
  })
  default = {
    cpu    = 500,
    memory = 1024
  }
  description = "Hive resources"
}

variable "resource_proxy" {
  type = object({
    cpu    = number,
    memory = number
  })
  default = {
    cpu    = 200,
    memory = 128
  }
  description = "Hive proxy resources"
  validation {
    condition     = var.resource_proxy.cpu >= 200 && var.resource_proxy.memory >= 128
    error_message = "Proxy resource must be at least: cpu=200, memory=128."
  }
}

# Minio
variable "minio_service" {
  type = object({
    service_name = string
    port         = number
    access_key   = string
    secret_key   = string
  })
  description = "Minio data-object contains service_name, port, access_key and secret_key"
}

variable "minio_vault_secret" {
  type = object({
    use_vault_provider        = bool
    vault_kv_policy_name      = string
    vault_kv_path             = string
    vault_kv_field_access_key = string
    vault_kv_field_secret_key = string
  })
  description = "Set of properties to be able to fetch secret from vault"
  default = {
    use_vault_provider        = false
    vault_kv_policy_name      = "kv-secret"
    vault_kv_path             = "secret/path/to/minio/creds"
    vault_kv_field_access_key = "access_key"
    vault_kv_field_secret_key = "secret_key"
  }
}


# Postgres
variable "postgres_service" {
  type = object({
    service_name  = string
    port          = number
    database_name = string
    username      = string
    password      = string
  })
  description = "Postgres data-object contains service_name, port, database_name, username and password"
}
variable "postgres_vault_secret" {
  type = object({
    use_vault_provider      = bool
    vault_kv_policy_name    = string
    vault_kv_path           = string
    vault_kv_field_username = string
    vault_kv_field_password = string
  })
  description = "Set of properties to be able to fetch secret from vault"
  default = {
    use_vault_provider      = false
    vault_kv_policy_name    = "kv-secret"
    vault_kv_path           = "secret/path/to/postgres/creds"
    vault_kv_field_username = "username"
    vault_kv_field_password = "password"
  }
}
