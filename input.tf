variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "S0"
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}

variable "network" {
  type = object({
    app_subnet_id             = string
    service_runtime_subnet_id = string
    cidr_ranges = string
  })
}
