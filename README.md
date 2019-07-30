andrewrothstein.goreleaser
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-goreleaser.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-goreleaser)

Installs [goreleaser](https://goreleaser.com/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

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
