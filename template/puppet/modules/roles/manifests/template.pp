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

}
