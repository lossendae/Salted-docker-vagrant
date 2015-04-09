#
# legacy.apache
#
include:
  - .php

app-apache-legacy-image:
  docker.pulled:
    - name: lossendae/apache
    - force: true

app-apache-legacy-container:
  docker.installed:
    - image: lossendae/apache
    - ports:
      - "80/tcp"
    - watch:
      - docker: app-apache-legacy-image

app-apache-legacy-running:
  docker.running:
    - container: app-apache-legacy-container
    - privileged: true
    - links:
        app-php-legacy-container: lamp-legacy-link
    - volumes_from:
      - app-data-legacy-container
    - port_bindings:
        "80/tcp":
            HostIp: "0.0.0.0"
            HostPort: "80"
    - watch:
      - docker: app-php-legacy-container
    - require:
      - docker: app-php-legacy-running