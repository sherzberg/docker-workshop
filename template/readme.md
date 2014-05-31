Docker Workshop VM Template
===========================

This repository is used to setup a virtual machine to 
be used as a template for lots of other machines to use
in a Docker Workshop

Setup
-----

This is how the template was setup. This uses _loom_ and _puppet_
for configuration management.

```bash
$ pip install -r requirements.txt
$ fab -R template upgrade
$ fab -R template puppet.install
$ fab -R template provision
$ fab -R template ssh
```
