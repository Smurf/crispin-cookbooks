%post --interpreter /bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6

read -p "Paused"
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end
