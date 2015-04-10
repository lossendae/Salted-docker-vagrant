# Salted Vagrant Docker

This will automatically install [Docker](http://docker.io) using [Salt](http://saltstack.com/).
Docker will be automatically configured to accept connections from anywhere which means
you can alias ``docker`` on the host to talk directly with ``docker`` on the ``Vagrant`` virtual machine.

## Dependencies

For this to work you need the following installed.

* VirtualBox
* Vagrant 1.1+

## Usage

Clone the repo and ``vagrant up``

## TODO

- [x] Apache container
- [x] PHP 5.2.17 container
- [x] Data volume container
- [x] Install docker containers via Saltstack
- [ ] Use the unless commands to prevent duplicates and unnecessary cmd commands
- [ ] Handle graceful PID for Apache

## References

For testing purpose : http://dylanlindgren.com/docker-for-the-laravel-framework/