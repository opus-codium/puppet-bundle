class bundle::params {
  case $::osfamily {
    'FreeBSD': {
      $package = 'rubygem-bundler'
      $program = '/usr/local/bin/bundle'
    }
    'Debian': {
      $package = 'ruby-bundler'
      $program = '/usr/bin/bundle'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
