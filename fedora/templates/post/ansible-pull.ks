%post --interpreter /bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6

dnf install ansible ansible-core -y
# Install useful ansible galaxy packages
ansible-galaxy collection install community.general --force

LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 ansible-pull -d /etc/local/ansible -C '{{ branch }}' -U {{ ansible_repo }}
read -p "Paused"
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end
