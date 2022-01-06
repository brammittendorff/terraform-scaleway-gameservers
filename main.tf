data "template_file" "userdata" {
  count = var.server_count

  template = file("${path.module}/cloud-init.yml")

  vars = {
    distrib        = regex("^ubuntu|debian", var.server_image)
    user           = var.username
    server_name    = var.server_name
    server_count   = var.server_count
    current_server = count.index
    game_password  = var.game_password
    current_ip     = scaleway_instance_ip.public_ip[count.index].id
  }
}

resource "scaleway_instance_security_group" "game_ports" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }

  inbound_rule {
    action    = "accept"
    port      = "3979"
  }

  inbound_rule {
    action    = "accept"
    protocol  = "UDP"
    port      = "3979"
  }

  inbound_rule {
    action = "accept"
    port   = "1234"
  }
}

resource "scaleway_instance_ip" "public_ip" {
  count = var.server_count
}

resource "scaleway_instance_server" "server" {
  count = var.server_count

  name = "${var.server_name}-${count.index}"

  image = var.server_image
  type  = var.server_type

  ip_id = scaleway_instance_ip.public_ip[count.index].id

  security_group_id = scaleway_instance_security_group.game_ports.id

  # initialization sequence
  cloud_init = data.template_file.userdata[count.index].rendered
}
