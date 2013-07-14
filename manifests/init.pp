class postgrey(
  $enable = true,
  $start = true
) {
  class{'postgrey::install': } ->
  class{'postgrey::config': } ~>
  class{'postgrey::service': } ->
  Class["postgrey"]
}

