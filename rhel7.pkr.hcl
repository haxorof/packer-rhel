source "virtualbox-iso" "rhel-7" {
  boot_command     = ["<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  boot_wait        = "10s"
  disk_size        = 81920
  guest_os_type    = "RedHat_64"
  headless         = true
  http_directory   = "http"
  iso_checksum     = "sha256:19d653ce2f04f202e79773a0cbeda82070e7527557e814ebbce658773fbe8191"
  iso_urls         = ["iso/rhel-server-7.9-x86_64-dvd.iso"]
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
  vm_name          = "packer-rhel-7-x86_64"
}

build {
  sources = ["source.virtualbox-iso.rhel-7"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/cleanup.sh"
  }

  post-processor "vagrant" {
    output = "builds/<no value>-rhel-7.box"
  }
}
