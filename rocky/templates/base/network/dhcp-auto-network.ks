
{% if hostname != "PROMPT" %}
network --bootproto=dhcp --hostname={{ hostname }} --activate
{% else %}

%pre --interpreter /bin/bash 
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6

read -p "Enter the device hostname:" entered_hostname

echo "network --bootproto=dhcp --hostname=$entered_hostname --activate" > /tmp/network.ks
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end

%include /tmp/network.ks

{% endif %}
