variable "SHORT_PROJECT_NAME" {
  description = "A short, max 5 letter, name of the project. It must be just lowercase letters"
  type        = string
}

variable "PROJECT_NAME" {
  description = "The name of the project"
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID which should be used."
  type        = string
}

variable "client_id" {
  description = "The Client ID which should be used."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret which should be used."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Tenant ID which should be used."
  type        = string
}

variable "location" {
  description = "The azure location e.g. Australia East"
  type        = string
  default     = "Australia East"
}
