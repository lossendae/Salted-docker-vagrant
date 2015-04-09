#
# legacy.php
#
include:
  - .data
    
app-php-legacy-image:
  docker.pulled:
    - name: lossendae/php52
    - force: true

app-php-legacy-container:
  docker.installed:
    - image: lossendae/php52
    - watch:
      - docker: app-php-legacy-image

app-php-legacy-running:
  docker.running:
    - container: app-php-legacy-container
    - privileged: true
    - volumes_from:
      - app-data-legacy-container
    - watch:
      - docker: app-php-legacy-container
    - require:
      - docker: app-data-legacy-created
