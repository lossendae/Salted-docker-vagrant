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
    - enable: True
    # - reload: True
    - watch:
      - pkg: lxc-docker