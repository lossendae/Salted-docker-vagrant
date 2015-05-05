#
# docker.install
#
# Installs Docker
#

# http://www.boronine.com/2013/12/30/Installing-Docker-on-Debian-Jessie/
# https://github.com/blast-hardcheese/talk-docker/blob/master/srv/salt/docker.sls

{% set docker_version = "latest" %}

include:
  - .dependencies

docker:
  pkg.installed:
    - require:
      - pip: docker-py
  file.managed:
    - name: /usr/bin/docker
    - source:  https://get.docker.io/builds/Linux/x86_64/docker-{{ docker_version }}
    - source_hash: https://get.docker.io/builds/Linux/x86_64/docker-{{ docker_version }}.md5
    - mode: 755
  group.present:
    - addusers:
      - vagrant
  user.present:
    - name: vagrant
    - groups:
      - vagrant
      - docker
