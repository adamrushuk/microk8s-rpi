# update windows hosts file for local computer, as wsl overwrites /etc/hosts from this:
# C:\Windows\System32\drivers\etc\hosts
# sudo nano /etc/hosts
192.168.1.10    pi0
192.168.1.11    pi1
192.168.1.12    pi2
192.168.1.13    pi3

# Find dynamically assigned IP addresses of Raspberry Pi's
./scripts/Start-PingSweep.ps1
./scripts/Find-RPiNodeIpAddresses.ps1

# Login and change default password (ubuntu)
ssh ubuntu@<RapsberryPiIpAddress>

# copy ssh key to pi
ssh-copy-id ubuntu@<RapsberryPiIpAddress>

# Update hostname
sudo hostnamectl set-hostname <NewHostname>

# Set static IP address
# see scripts/50-cloud-init.yaml.example
cat /etc/netplan/50-cloud-init.yaml
sudo nano /etc/netplan/50-cloud-init.yaml
sudo netplan apply

# Log back in using new static IP address, then
# check IP and default gateway
ssh ubuntu@<StaticIpAddress>
ip r

# Update packages
sudo apt update -q && sudo apt upgrade -qy
sudo apt install -qy tree

# Reboot
sudo reboot
