class postgrey::install() {
  package { 'postgrey':
    ensure => present;
  }

  file { '/etc/postgrey':
    ensure => directory
  }
}

