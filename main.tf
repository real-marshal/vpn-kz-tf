resource "serverspace_ssh" "key" {
  name = "tf"
  public_key = file(var.ssh_pubkey_path)
}

resource "serverspace_server" "vpn" {
  name = "vpn"
  image = "Ubuntu-22.04-X64"
  location = "am2"
  cpu = 1
  ram = 1024

  boot_volume_size = 25 * 1024

  nic {
    network = ""
    network_type = "PublicShared"
    bandwidth = var.server_bandwidth
  }

  ssh_keys = [
    serverspace_ssh.key.id
  ]

  provisioner "remote-exec" {
    script = "./bootstrap.sh"

    connection {
      type = "ssh"
      user = "root"
      host = self.public_ip_addresses[0]
      private_key = file(var.ssh_key_path)
    }
  }
}

data "remote_file" "outline_config" {
  depends_on = [serverspace_server.vpn]
  path = "./outline_config"

  conn {
    user     = "root"
    host     = serverspace_server.vpn.public_ip_addresses[0]
    private_key = file(var.ssh_key_path)
  }
}