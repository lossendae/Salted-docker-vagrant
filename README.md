# Salted Vagrant Docker

This will automatically install [Docker](http://docker.io) using [Salt](http://saltstack.com/).
Docker will be automatically configured to accept connections from anywhere which means
you can alias ``docker`` on the host to talk directly with ``docker`` on the ``Vagrant`` virtual machine.

## Dependencies

For this to work you need the following installed.

* VirtualBox
* Vagrant 1.1+

## Usage

Clone the repo and ``vagrant up && vagrant reload``

## Credits

Organization and this file inspired by : https://github.com/krak3n/salted-docker-vagrant

## TODO

[ ] Use the unless commands to prevent duplicates and unnecessary cmd commands

For testing purpose : http://dylanlindgren.com/docker-for-the-laravel-framework/

[ ] Install following containers via Saltstack (?) :

```
sudo docker pull dylanlindgren/docker-laravel-data && \
sudo docker pull dylanlindgren/docker-laravel-composer && \
sudo docker pull dylanlindgren/docker-laravel-artisan && \
sudo docker pull dylanlindgren/docker-laravel-phpfpm && \
sudo docker pull dylanlindgren/docker-laravel-nginx && \

sudo docker run --name myapp-data -v /app:/data:rw dylanlindgren/docker-laravel-data  
sudo docker run --privileged=true --volumes-from myapp-data --rm dylanlindgren/docker-laravel-composer create-project laravel/laravel data/www --prefer-dist
sudo docker run --privileged=true --name myapp-php --volumes-from myapp-data -d dylanlindgren/docker-laravel-phpfpm
sudo docker run --privileged=true --name myapp-web --volumes-from myapp-data -p 8080:80 --lin
```

Create containers for : 

[ ] Apache 
[-] PHP 5.2.17 
[ ] Data
