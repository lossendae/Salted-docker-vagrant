#
# legacy.data
#
    
app-data-legacy-image:
  docker.pulled:
    - name: lossendae/data
    - force: true

app-data-legacy-container:
  docker.installed:
    - image: lossendae/data
    - require:
      - docker: app-data-legacy-image

# Beware of indentation in bindings - https://github.com/saltstack/salt/issues/14089#issuecomment-59634620
app-data-legacy-created:
  docker.running:
    - container: app-data-legacy-container
    - check_is_running: false
    - binds:
        /app:
          bind: /var/www
          ro: false
    - require:
      - docker: app-data-legacy-container