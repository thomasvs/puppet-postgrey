class postgrey::params (
) {
  case $::osfamily {
    'RedHat': {
      $postgrey_dir = '/etc/postfix'
      $postgrey_prefix = 'postgrey_'
      $local_postfix = '.local'
      $default = 'redhat'
    }
    default: {
      $postgrey_dir = '/etc/postgrey'
      $postgrey_prefix = ''
      $local_postfix = '' # the original debian postgrey puppet module used the main files
      $default = 'debian'
    }
  }

  $whitelist_clients = "${postgrey_dir}/${postgrey_prefix}whitelist_clients"
  $whitelist_recipients = "${postgrey_dir}/${postgrey_prefix}whitelist_recipients"
  $whitelist_clients_local = "${whitelist_clients}${local_postfix}"
  $whitelist_recipients_local = "${whitelist_recipients}${local_postfix}"
}
