class bundle (
  String $package,
  String $command,
) {
  ensure_packages($package, { ensure => installed })

  Package <| |> -> Bundle::Install <| |>
  Package <| |> -> Bundle::Exec <| |>
}
