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

- [x] Nginx container
- [x] Apache container
- [x] PHP 5.2.17 container
- [x] PHP 5.6 container
- [x] Automatize docker containers deployment via Saltstack
- [ ] Use the unless commands to prevent duplicates and unnecessary cmd commands
- [x] Handle graceful PID for Apache

## Run states from the host vm

```
salt-call state.highstate --local -l debug
```

## Change default editor

```
sudo update-alternatives --config editor
```gren.com/docker-for-the-laravel-framework/
