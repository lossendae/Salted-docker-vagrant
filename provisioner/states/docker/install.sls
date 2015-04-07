#
# docker.install
#
# Installs Docker
#
include:
  - .dependencies

install-docker:
    cmd.run:
      - name: curl -sSL https://get.docker.com/ | sh
      - require:
        - pkg: linux-image-amd64

lxc-docker:
  pkg:
    - installed
    - require:
      - pkg: python-software-properties
    - require:
      - cmd: install-docker