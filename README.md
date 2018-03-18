## Synopsis

This is a fully functional updated standalone Ansible script for building a Cuckoo Sandbox server out of box. The following capabilities are included:

- Cuckoo Sandbox v2 inside virtual environment
- Yara v3
- Volatility v2
- Suricata IDS v4
- Java v8 and Elasticsearch v5
- Moloch v0.5
- Support for ESX, vSphere, KVM and AVD (with pre-configured avd image) machinery
- Current using VirtualBox v5 machinery with Extensions Pack
- Django-based Web Interface and MongoDB
- PostgreSQL
- SSDeep
- Tcpdump
- M2Crypto

## Installation

This installation process has been success tested against a fresh install of _Ubuntu 16.04 Desktop (amd64) and Ubuntu 17.10 Minimal (amd64)_ with the following package options:

- openssh-server

Also, ensure a cuckoo1.[ova/ovf] file in your ADMIN - detailed below - home folder.

After the base OS install a dist-upgrade was conducted:

`apt update & apt dist-upgrade`

You may want to install Ansible with the [install_ansible.sh](install_ansible.sh) script, for Ubuntu only.

You also may need log in via ssh first before run Ansible to ensure the ssh key of your remote machine into your system.

You can customize your target Ubuntu distro and the server network interface under:

    --extra-vars "distribution=artful nic=enp0s3"

Installation of the Cuckoo environment is done with the following steps:

1. Clone this repository:
`git clone https://github.com/MalwareReverseBrasil/Ansible-Cuckoo.git`
2. Replace the placeholders in **cuckoo-playbook/inventories/production/hosts** with the correct ones for your installation, where:
    - **HOST** is the IP address of the server to install Cuckoo to. _Note: the comma after the HOST is not a typo. Ansible is expecting a list, so the comma is required_
    - **ADMIN** is a user with sudo privileges on the server
    - **PASSWORD** is the user _ADMIN_ password
4. Run the following command inside cuckoo-playbook folder:

```
ansible-playbook -i inventories/production site.yml --extra-vars "distribution=artful nic=enp0s3"
```

By default, Cuckoo will be installed to `/opt/cuckoo` inside a virtual environment and a `cuckoo` user and group will be created. These values can be modified at group_vars file:

    cuckoo_user: 'cuckoo'
    cuckoo_dir: '/opt/cuckoo'

## Usage

Once the installation has completed, Moloch, Suricata, Cuckoo API, Rooter, Sandbox and it's web interface will start up automatically.
If you need to restart everything after some shutdown do:

    sudo /opt/cuckoo/bin/cuckoo rooter &
    sudo suricata -D --user=cuckoo --group=cuckoo --unix-socket=cuckoo.socket
    sudo systemctl start molochcapture.service
    sudo systemctl start molochviewer.service

As `cuckoo` user:

    . /opt/cuckoo/bin/activate
    (cuckoo)$ cuckoo -d &
    (cuckoo)$ cuckoo web runserver 0.0.0.0:8080 &
    (cuckoo)$ cuckoo api --host 0.0.0.0 --port 8081 &
    
## Find yourself

- Cuckoo Instalation: http://docs.cuckoosandbox.org/en/latest/installation/
- CuckooDroid Instalation:
    - https://github.com/idanr1986/cuckoo-droid
    - https://github.com/idanr1986/cuckoodroid-2.0
- Cuckoo community modules: https://github.com/cuckoosandbox/community/tree/master/modules
- Ansible Instalation: https://docs.ansible.com/ansible/latest/intro_installation.html
- Guia em pt-BR de setup do Cuckoo + VM: [instalacao_do_cuckoo_sandbox.pdf](references/instalacao_do_cuckoo_sandbox.pdf)
- Tips to setup a guest victim VM can be found at [tips_to_prepare_win7_victim.md](references/tips_to_prepare_win7_victim.md)
- Check the VBoxHardenedLoader: https://github.com/hfiref0x/VBoxHardenedLoader