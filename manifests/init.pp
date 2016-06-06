class bundle (
  $package = $::bundler::package,
  $command = $::bundler::command,
) inherits bundle::params {
  package { $package:
    ensure => installed,
  }
}
