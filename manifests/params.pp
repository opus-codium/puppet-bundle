class bundle::params {
  case $::osfamily {
    'freeBSD': {
      $package = 'rubygem-bundler'
      $command = '/usr/local/bin/bundle'
    }
    'debian': {
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
