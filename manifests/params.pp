class bundle::params {
  case $::osfamily {
    'freeBSD': {
      $package = 'rubygem-bundler'
      $command = '/usr/local/bin/bundle'
    }
    'debian': {
      if versioncmp($::operatingsystemrelease, '9.0') < 0 {
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
