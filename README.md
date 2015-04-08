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

Create containers for : 

- [x] Apache 
- [x] PHP 5.2.17 
- [x] Data

Saltstack :

- [ ] Use the unless commands to prevent duplicates and unnecessary cmd commands

For testing purpose : http://dylanlindgren.com/docker-for-the-laravel-framework/

- [ ] Install docker containers via Saltstack

## Misc

Debug containers locally :

```
sudo docker build -t lossendae/data .
sudo docker build -t lossendae/php52 .
sudo docker build -t lossendae/apache .

sudo docker run --name app-data -v /app:/var/www:rw lossendae/data 
sudo docker run --privileged=true --name app-php --volumes-from app-data -d lossendae/php52  
sudo docker run --privileged=true --name app-apache --volumes-from app-data -p 80:80 --link app-php:lamp-legacy -d lossendae/apache  

#status
sudo docker ps -a

#remove image
sudo docker rmi <image>

#remove container
sudo docker rm <container-name>

#logs
sudo docker logs <container-name>
```