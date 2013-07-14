class postgrey(
  $enable = true,
  $start = true,
  $default_whitelist_clients = true,
  $whitelist_clients = []
  $default_whitelist_recipients = true,
  $whitelist_recipients = []
) {
  class{'postgrey::install': } ->
  class{'postgrey::config': } ~>
  class{'postgrey::service': } ->
  Class["postgrey"]
}

