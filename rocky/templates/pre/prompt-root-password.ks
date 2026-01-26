%pre --interpreter /usr/bin/bash
exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
chvt 6
# Define the output file
FILE="/tmp/root-pw.ks"

while true; do
    # -s flag hides the input as the user types
    read -rs -p "Enter Root Password: " P1
    echo
    read -rs -p "Confirm Root Password: " P2
    echo

    if [ "$P1" == "$P2" ]; then
        break
    else
        echo "Passwords do not match. Please try again."
        echo
    fi
done

# Generate the valid Unix $6$ (SHA-512) hash using openssl
# -6 specifies the SHA-512 crypt algorithm
HASH=$(echo -n "$P1" | openssl passwd -6 -stdin)

# Write to the file in the requested format
echo "rootpw --iscrypted $HASH" > "$FILE"

echo "--------------------------------------"
echo "Success! Kickstart file written to: $FILE"
echo "Content: $(cat $FILE)"
chvt 1
exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
%end

%include /tmp/root-pw.ks
