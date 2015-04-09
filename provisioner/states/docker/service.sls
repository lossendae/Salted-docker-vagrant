#
# docker.service
#
# Docker Service Management
#
include:
  - .install

docker_service:
  service.running:
    - name: docker
    - sig: /usr/bin/docker
    # - enable: True
    # - reload: True
    - require:
      - pkg: lxc-docker