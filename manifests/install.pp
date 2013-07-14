class postgrey::install() {
  package { 'postgrey':
    ensure => present;
  }
}

