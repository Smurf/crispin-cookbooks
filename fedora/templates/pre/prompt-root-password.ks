%pre --interpreter /usr/bin/python3
import hashlib
import secrets
import getpass
import sys

def generate_linux_hash(password):
    # Standard SHA-512 crypt prefix
    prefix = "$6$"
    # Generate a random 16-character salt
    salt_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789./"
    salt = "".join(secrets.choice(salt_chars) for _ in range(16))
    
    h = hashlib.sha512()
    h.update((salt + password).encode('utf-8'))

    hashed = h.hexdigest()
    
    return f"{prefix}{salt}${hashed}"

try:
    while True:
        pw = getpass.getpass("Root password: ")
        confirm = getpass.getpass("Verify password: ")
        if pw == confirm and pw != "":
            # Using hashlib to generate the hex digest 
            hashed_pw = generate_linux_hash(pw)
            break
        print("Passwords did not match. Try again.", file=sys.stderr) [cite: 3]

    with open("/tmp/root-pw.ks", "w") as f:
        f.write(f"rootpw --iscrypted {hashed_pw}\n") [cite: 2]

except Exception as e:
    sys.exit(1)
%end

%include /tmp/root-pw.ks
