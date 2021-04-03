# packer-rhel

Build RHEL 7:

```console
# packer build rhel7.pkr.json
```

or

```console
# packer build rhel7.pkr.hcl
```

Build RHEL 8:

```console
# packer build rhel8.pkr.json
```

or

```console
# packer build rhel8.pkr.hcl
```

Test after build:

```console
# export RHEL_VERSION=8
# vagrant up
``´