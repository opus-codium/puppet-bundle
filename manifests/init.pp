class bundle (
  String $package = $::bundle::params::package,
  String $command = $::bundle::params::command,
) inherits bundle::params {
  ensure_packages($package, { ensure => installed })

  Package <| |> -> Bundle::Install <| |>
  Package <| |> -> Bundle::Exec <| |>
}
