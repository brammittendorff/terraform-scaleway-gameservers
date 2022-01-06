output "public_ips" {
  value = scaleway_instance_server.server.*.public_ip
}