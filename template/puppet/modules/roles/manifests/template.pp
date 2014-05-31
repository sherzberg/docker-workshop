class roles::template {

  package {'cowsay':
    ensure => present,
  }

  class {'docker':
    version => '0.11.1',
  }

  docker::image {'stackbrew/ubuntu':
    image_tag => '14.04',
  }

  include wget

  wget::fetch {'https://github.com/orchardup/fig/releases/download/0.4.1/linux':
    destination => '/usr/local/bin/fig',
  }
  ->
  file {'/usr/local/bin/fig':
    ensure => present,
    mode   => 555,
  }

}
