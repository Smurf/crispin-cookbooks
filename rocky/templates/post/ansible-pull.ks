%post --interpreter /bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6

dnf install epel-release -y
dnf install ansible-core -y
# Install useful ansible galaxy packages
ansible-galaxy collection install community.general --force

LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 ansible-pull -d /etc/local/ansible -C '{{ ansible_pull.branch }}' -U {{ ansible_pull.repo_url }} {{ ansible_pull.options }}
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end
