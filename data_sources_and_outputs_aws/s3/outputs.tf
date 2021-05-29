# a simple way to return information in CLI when running a terraform command
output "server" {
  value = local.instance
}