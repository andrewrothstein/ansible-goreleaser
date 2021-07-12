andrewrothstein.goreleaser
=========
![Build Status](https://github.com/andrewrothstein/ansible-goreleaser/actions/workflows/build.yml/badge.svg)


Installs [goreleaser](https://goreleaser.com/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

> Note: If goreleaser_installer is toggled between Homebrew (brew) and tar.gz (tgz) mode, please make sure the executable is re-linked if you want to leverage the Homebrew version: `brew unlink goreleaser && brew link goreleaser`

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.goreleaser
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
