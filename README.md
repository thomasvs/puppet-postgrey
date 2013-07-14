# What is it?

A puppet module for managing postgrey (http://postgrey.schweikert.ch/)

# How do I use it?

Just include the 'postgrey' module

<pre>
  include postgrey
</pre>

# Further configuration

The whitelists of senders and recipients can be configured in the
module, either by supplying parameters, or by hiera data bindings.

The following configuration keys are available:

## $enable = true

If the postgrey service should be enabled

## $start = true

If the postgrey service should be started

## $port = 10023

The port to run the service on

## $host = 127.0.0.1

The host to bind the service to listen to

## $delay = 300

greylist for N seconds

## $max_age = 35

delete entries older than N days since the last time
that they have been seen

## $auto_whitelist_clients = 5

whitelist host after first successful delivery
N is the minimal count of mails before a client is
whitelisted (turned on by default with value 5)
specify N=0 to disable

## $retry_window = 2,

allow only N days for the first retrial (default: 2)
append 'h' if you want to specify it in hours

## $extra_options = ''

Any extra options to supply to the daemon. See man postgrey(8)

## $default_whitelist_clients = true

If the default list of whitelist clients should be used

## $whitelist_clients = []

Additional clients to whitelist

## default_whitelist_recipients = true

If the default list of recipients should be whitelisted (abuse@ and postmaster@)

## $whitelist_recipients = []

Additional recipients to whitelist.


