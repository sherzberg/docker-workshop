import os

from fabric.api import task, env, execute, put, run, sudo, settings, hide, local
from loom import puppet
from loom.tasks import *


env.loom_librarian_version = None
env.roledefs = {
    'template': ['root@{ip}'.format(ip=os.environ['TEMPLATE_IP'])],
}
env.puppet_module_dir = 'puppet/modules'


@task
def provision():
    execute(puppet.update)
    execute(puppet.apply)
