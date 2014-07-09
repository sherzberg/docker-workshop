class workshop::run {

  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  package {'cowsay':
    ensure => present,
  }

  class {'docker':
    version => '1.0.0',
  }

  docker::image {'stackbrew/ubuntu':
    image_tag => '14.04',
  }

  docker::image {'litaio/ruby':
  }

  docker::image {'orchardup/mysql':
  }

  docker::image {'sherzberg/python-all-dev':
  }

  docker::image {'redis':
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
