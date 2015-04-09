#
# docker.dependencies
#
# Dependencies for installing Docker
#
python-software-properties:
  pkg.installed

python-pip:
  pkg.installed:
    - require:
      - pkg: python-software-properties

# salt.states.dockerio state module requires docker-py which supports Docker Remote API version 1.6.
docker-py:
  pip.installed:
    - reload_modules: true
    - require:
      - pkg: python-pip

wheezy-backports-repo:
  pkgrepo.managed:
    - name: deb http://http.debian.net/debian wheezy-backports main
    - file: /etc/apt/sources.list.d/wheezy-backports.list

linux-image-amd64:
   pkg.installed:
     - require:
       - pkgrepo: wheezy-backports-repo