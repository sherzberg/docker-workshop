class roles::template {

  package {'cowsay':
    ensure => present,
  }

  class {'docker':
    version => '0.11.1',
  }

}
