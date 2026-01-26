%post --interpreter /bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6


set -e
read -p "Enter the username to create: " username
read -sp "Enter the password for $username: " password

useradd -m $username
cat << EOF | chpasswd
$username:$password
EOF

echo "User $username created successfully!"
read -p "PAUSED"
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end
