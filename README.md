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

## $default_whitelist_clients = true

If the default list of whitelist clients should be used

## $whitelist_clients = []

Additional clients to whitelist

## default_whitelist_recipients = true

If the default list of recipients should be whitelisted (abuse@ and postmaster@)

## $whitelist_recipients = []

Additional recipients to whitelist.


