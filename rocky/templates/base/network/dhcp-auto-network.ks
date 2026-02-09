
{% if hostname is defined %}
network --bootproto=dhcp --hostname={{ hostname }} --activate
{% else %}

%pre --interpreter /bin/bash 

read -p "Enter the device hostname:" enetered_hostname

echo "network --bootproto=dhcp --hostanme=$entered_hostname --activate" > /tmp/network.ks
%end

%include /tmp/network.ks

{% endif %}
