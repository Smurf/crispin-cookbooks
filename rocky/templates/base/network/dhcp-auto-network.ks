
{% if hostname != "PROMPT" %}
network --bootproto=dhcp --hostname={{ hostname }} --activate
{% else %}

%pre --interpreter /bin/bash 

read -p "Enter the device hostname:" entered_hostname

echo "network --bootproto=dhcp --hostanme=${entered_hostname} --activate" > /tmp/network.ks
%end

%include /tmp/network.ks

{% endif %}
