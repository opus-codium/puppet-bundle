class bundle (
  $package = $::bundle::params::package,
  $command = $::bundle::params::command,
) inherits bundle::params {
  package { $package:
    ensure => installed,
  }

  Package <| |> -> Bundle::Install <| |>
  Package <| |> -> Bundle::Exec <| |>
}
