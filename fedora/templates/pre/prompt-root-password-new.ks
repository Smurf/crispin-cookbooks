%pre --interpreter /bin/bash 

# This will eventually be depreciated.
hashed_pw=$(python3 -c 'import crypt,getpass;pw=getpass.getpass("Root password:");print(crypt.crypt(pw, crypt.mksalt()) if (pw==getpass.getpass("Verify password: ")) else exit())')

# Set root password
echo "rootpw --iscrypted $hashed_pw" > /tmp/root-config.ks
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end

%include /tmp/root-config.ks
