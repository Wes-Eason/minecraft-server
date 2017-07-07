#!/bin/bash

PACKAGE_LIST="/vagrant/setup/apt-packages.txt"
JRE_TARBALL="/vagrant/setup/jre-8u131-linux-x64.tar.gz"
JAVADIR="/usr/local/java/jre1.8.0_131"
SERVER_PATH="/vagrant/server"

# Set up users and groups
groupadd java

useradd mc-server
usermod -aG java mc-server

# Install apt packages from $PACKAGE_LIST
apt-get update

for package in $(cat "$PACKAGE_LIST" | tr -d '\r' | sed 's/#.*$//g' | grep -v '^[[:space:]]*$'); do
    apt-get install -y "$package"
done

# Install Java
mkdir -p /usr/local/java
(
  cd /usr/local/java
  tar -zxf "$JRE_TARBALL"
  chown -R root:java "$JAVADIR"
  cd "$JAVADIR/bin"
  chmod 754 ./*
  ln -s $PWD/* /usr/local/bin/
)

# Configure mc server
echo "eula=true" > /vagrant/server/eula.txt

install -o root -g root -m 0754 /vagrant/setup/mc-server /bin/mc-server
chmod u+t /bin/mc-server

# # import my dotfiles from github
# mkdir git
# git clone https://github.com/whandi/dotfiles.git git/dotfiles
# (
#     cd git/dotfiles
#     make
#     mkdir ~/.vimbackup
# )
