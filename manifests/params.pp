class bundle::params {
  case $::osfamily {
    'FreeBSD': {
      $package = 'rubygem-bundler'
      $command = '/usr/local/bin/bundle'
    }
    'Debian': {
      $package = 'ruby-bundler'
      $command = '/usr/bin/bundle'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
