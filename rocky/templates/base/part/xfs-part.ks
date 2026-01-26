# Generated using Blivet version 3.4.3    
ignoredisk --only-use={{ disk_dev }}
# Partition clearing information
zerombr
clearpart --all --initlabel --disklabel=gpt
# Disk partitioning information    
part /boot/efi --fstype=efi --size=600
part /boot --fstype=xfs --size=1024
part pv.0 --fstype=lvmpv --grow
volgroup rl0 --pesize=4096 pv.0
logvol / --vgname=rl0 --name=root --fstype=xfs --size=30000
logvol swap --vgname=rl0 --name=swap --fstype=swap --size=1024
# Give some flexibility for docker/podman
logvol /var --vgname=rl0 --name=var --fstype=xfs --size=60000
logvol /var/log --vgname=rl0 --name=var_log --fstype=xfs --size=10000
logvol /home --vgname=rl0 --name=home --fstype=xfs --size=10000
