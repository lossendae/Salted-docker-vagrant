#
# docker.service
#
# Docker Service Management
#
include:
  - .install

docker.service:
  file.managed:
    - name: /etc/systemd/system/docker.service
    - source: salt://docker/system/docker.service
    - mode: 755

docker.socket:
  file.managed:
    - name: /etc/systemd/system/docker.socket
    - source: salt://docker/system/docker.socket
    - mode: 755

docker_service:
  service.running:
    - name: docker
    - sig: /usr/bin/docker
    - enable: True
    # - reload: True
    - require:
      - file: docker
      - file: docker.service
      - file: docker.socket
