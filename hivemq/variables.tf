variable "hivemq_chart_values" {}
variable "nginx_chart_values" {}
variable "chart_version" {}
variable "domain" {
  default = "example.com"
}
variable "namespace" {
  default = "hivemq"
}
variable "create_namespace" {
  default = true
}
