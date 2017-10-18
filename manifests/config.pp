class postgrey::config() {

  include postgrey::params

  file {
    '/etc/default/postgrey':
      content => template('postgrey/default.erb');
  }

  concat { [
      $postgrey::params::whitelist_clients,
      $postgrey::params::whitelist_clients_local,
    ]:
  }

  concat::fragment { 'postgrey/whitelist_clients/header':
     target => $postgrey::params::whitelist_clients,
     order  => 00,
     source => 'puppet:///modules/postgrey/whitelist_clients.header';
  }

  if ($postgrey::default_whitelist_clients == true) {
    concat::fragment { 'postgrey/whitelist_clients/default':
      target => $postgrey::params::whitelist_clients,
      order  => 10,
      source => "puppet:///modules/postgrey/whitelist_clients.default.${postgrey::params::default}";
    }
  }

  if ($postgrey::whitelist_clients != []) {
    concat::fragment { 'postgrey/whitelist_clients':
      target  => $postgrey::params::whitelist_clients_local,
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_clients").join("\n") + "\n" %>')
    }
  }

  concat { [
      $postgrey::params::whitelist_recipients,
      $postgrey::params::whitelist_recipients_local,
    ]:
  }

  concat::fragment { 'postgrey/whitelist_recipients/header':
     target => $postgrey::params::whitelist_recipients,
     order  => 00,
     source => 'puppet:///modules/postgrey/whitelist_recipients.header';
  }

  if ($postgrey::default_whitelist_recipients == true) {
    concat::fragment { 'postgrey/whitelist_recipients/default':
      target => $postgrey::params::whitelist_recipients,
      order  => 10,
      source => 'puppet:///modules/postgrey/whitelist_recipients.default';
    }
  }

  if ($postgrey::whitelist_recipients != []) {
    concat::fragment { 'postgrey/whitelist_recipients':
      target  => $postgrey::params::whitelist_recipients_local,
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_recipients").join("\n") + "\n" %>')
    }
  }
}
