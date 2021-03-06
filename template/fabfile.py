import os

from fabric.api import task, env, execute, put, run, sudo, settings, hide, local
from loom import puppet
from loom.tasks import uptime, ssh



env.key_filename = [os.path.expanduser("~/.ssh/iowaruby.pem")]
env.loom_librarian_version = None
env.user = 'root'
env.roledefs = {
    'template': [os.environ['TEMPLATE_IP']],
    'test': [os.environ['TEST_IP']],
    'slave': os.environ['ALL_IPS'].split(),
}
env.puppet_module_dir = 'puppet/modules'


@task
def provision():
    execute(puppet.update)
    execute(puppet.apply)
