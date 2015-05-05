#
# docker.dependencies
#
# Dependencies for installing Docker
# @see : http://docs.saltstack.com/en/latest/ref/states/#reloading-modules
#
python-setuptools:
  pkg.installed

python-pip:
  cmd.run:
    - name: |
        easy_install --script-dir=/usr/bin -U pip
    - cwd: /
    - reload_modules: true
    - require:
      - pkg: python-setuptools

# salt.states.dockerio state module requires docker-py which supports Docker Remote API version 1.6.
docker-py:
  pip.installed:
    - reload_modules: True
    - require:
      - cmd: python-pip