# Minecraft Server
This is a minecraft server that runs inside of a VM for security and convenience.  To run the server, you will need to install VirtualBox, Vagrant, and on windows, git-scm (at least the command line interface).

To install a server, extract the server's zip or tarball to `./server`.

To launch the server, open bash to the directory containing the Vagrantfile.  Then, run `vagrant up` to start the vm and `vagrant ssh` to access the server's terminal.  To run the minecraft server, simply run `mc-server`.

## Notes
- Running `vagrant destroy` will not delete the server's files, which are stored in a shared directory on the host system.
- Since Java has a restrictive license, you will have to get it yourself.
