class bundle (
  $package = $::bundle::params::package,
  $command = $::bundle::params::command,
) inherits bundle::params {
  ensure_packages($package, { ensure => installed })

  Package <| |> -> Bundle::Install <| |>
  Package <| |> -> Bundle::Exec <| |>
}
