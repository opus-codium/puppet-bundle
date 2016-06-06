class bundle (
  $package = $::bundle::package,
  $command = $::bundle::command,
) inherits bundle::params {
  package { $package:
    ensure => installed,
  }
}
