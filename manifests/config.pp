class postgrey::config() {
  file {
    '/etc/postgrey/whitelist_clients':
      source => 'puppet:///modules/postgrey/whitelist_clients';
    '/etc/postgrey/whitelist_recipients':
      source => 'puppet:///modules/postgrey/whitelist_recipients';
  }
}

