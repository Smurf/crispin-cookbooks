%post --interpreter /bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6

echo "Ignoring lid switch if exists"
echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchExternalPower=ignore\nHandleLidSwitchDocked=ignore\nLidSwitchIgnoreInhibited=off" > /etc/systemd/logind.conf
echo "Masking suspend targets"
systemctl mask suspend.target sleep.target hybrid-sleep.target hibernate.target

chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end
