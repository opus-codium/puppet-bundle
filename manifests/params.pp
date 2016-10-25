class bundle::params {
  case $::osfamily {
    'FreeBSD': {
      $package = 'rubygem-bundler'
      $command = '/usr/local/bin/bundle'
    }
    'Debian': {
      if $::operatingsystemmajrelease <= '8' {
        $package = 'bundler'
      } else {
        $package = 'ruby-bundler'
      }
      $command = '/usr/bin/bundle'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
