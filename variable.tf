
variable "rgname" {
  type = string
}

variable "location" {
  type = string
}



variable "asp_name" {
  type = string
}

variable "webapp_name" {
  type = string
}


variable "storageaccount_name" {
  type = string
}

variable "backupname"{
  type = string
}

variable "tags_env"{
  type = string
}
variable "it_service"{
  type = string
}
variable "billing"{
  type = string
}

variable "container_name"{
  type = string
}

# App Service

variable "appservice_plan_tier" {
  type = string
}

variable "appservice_plan_size" {
  type = string
}

variable "asp_net_image" {
  type = string
}