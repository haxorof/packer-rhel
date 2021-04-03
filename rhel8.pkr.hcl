source "virtualbox-iso" "rhel-8" {
  boot_command     = ["<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks-8.cfg<enter><wait>"]
  boot_wait        = "10s"
  disk_size        = 81920
  guest_os_type    = "RedHat_64"
  headless         = true
  http_directory   = "http"
  iso_checksum     = "sha256:30fd8dff2d29a384bd97886fa826fa5be872213c81e853eae3f9d9674f720ad0"
  iso_urls         = ["iso/rhel-8.3-x86_64-dvd.iso"]
  shutdown_command = "echo 'vagrant'|sudo -S /sbin/halt -h -p"
  ssh_password     = "vagrant"
  ssh_port         = 22
  ssh_timeout      = "10000s"
  ssh_username     = "vagrant"
  vboxmanage       = [
                      ["modifyvm", "{{ .Name }}", "--memory", "1024"],
                      ["modifyvm", "{{ .Name }}", "--cpus", "2"],
                      ["modifyvm", "{{ .Name }}", "--spec-ctrl", "on"]
                     ]
  vm_name          = "packer-rhel-8-x86_64"
}

build {
  sources = ["source.virtualbox-iso.rhel-8"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/cleanup.sh"
  }

  post-processor "vagrant" {
    output = "builds/virtualbox-rhel-8.box"
  }
}
