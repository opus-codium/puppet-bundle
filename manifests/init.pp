class bundle (
  $package = $::bundle::params::package,
  $command = $::bundle::params::command,
) inherits bundle::params {
  package { $package:
    ensure => installed,
  }
}
