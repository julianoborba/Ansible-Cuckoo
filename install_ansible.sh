apt update
apt --assume-yes install software-properties-common
apt-add-repository ppa:ansible/ansible -y
apt update
apt --assume-yes install ansible sshpass
