#
# Common tools to install
#

common-pkgs:
  pkg.installed:
    - pkgs:
      - curl
      - htop
      - iotop
      - rsync
      - tmux
      - postgresql-client-9.4

git:
  pkg.installed

vim:
  pkg.installed

# Set as default editor
update-editor:
  cmd.run:
    - name: update-alternatives --set editor /usr/bin/vim.basic
    - require:
      - pkg: vim

# add viewable config file
/home/vagrant/.vim/vimrc:
  file.managed:
    - source: salt://tools/etc/vimrc
    - mode: 644
    - user: vagrant
    - group: vagrant
    - makedirs: True
    - require:
      - pkg: vim

# symlink it
/home/vagrant/.vimrc:
  file.symlink:
    - target: .vim/vimrc
    - user: vagrant
    - group: vagrant
    - force: True
    - require:
      - file: /home/vagrant/.vim/vimrc

# plugin manager for vim
https://github.com/tpope/vim-pathogen.git:
  git.latest:
    - target: /home/vagrant/.vim/pathogen
    - require:
      - pkg: vim
      - pkg: git

/home/vagrant/.vim/autoload/pathogen.vim:
  file.symlink:
    - target: ../pathogen/autoload/pathogen.vim
    - force: True
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True

# custom config
/home/vagrant/.vim/config/settings.vim:
  file.managed:
    - source: salt://tools/etc/settings.vim
    - mode: 755
    - user: vagrant
    - group: vagrant
    - makedirs: True
    - require:
      - pkg: vim

# Nice color scheme
git://github.com/altercation/vim-colors-solarized.git:
  git.latest:
    - target: /home/vagrant/.vim/bundle/vim-colors-solarized
    - require:
      - pkg: vim
      - pkg: git
