#
# docker.dependencies
#
# Dependencies for installing Docker
#
python-software-properties:
  pkg:
    - installed

wheezy-backports-repo:
  pkgrepo.managed:
    - name: deb http://http.debian.net/debian wheezy-backports main
    - file: /etc/apt/sources.list.d/wheezy-backports.list

linux-image-amd64:
   pkg:
     - installed
     - require:
       - pkgrepo: wheezy-backports-repo