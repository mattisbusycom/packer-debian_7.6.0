# Set up Vagrant.
date > /etc/vagrant_box_build_time

# Create the user spidadesign with password spidadesign
useradd -G sudo -p $(perl -e'print crypt("spidadesign", "spidadesign")') -m -s /bin/bash -N spidadesign

# Install spidadesign  keys
mkdir -pm 700 /home/spidadesign/.ssh
curl -Lo /home/spidadesign/.ssh/authorized_keys \
  'https://raw.github.com/mattisbusycom/spidadesign/master/keys/spidadesign.pub'
chmod 0600 /home/spidadesign/.ssh/authorized_keys
chown -R spidadesign:spidadesign /home/spidadesign/.ssh

# Customize the message of the day
echo 'Welcome to your SpidaDesign-built virtual machine.' > /var/run/motd

# Install NFS client
apt-get -y install nfs-common
