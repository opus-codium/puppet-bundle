# @summary Common code for bundler
#
# @param package Name of the bundler package
# @param command Path to the bundler command
class bundle (
  String $package,
  String $command,
) {
  ensure_packages($package, { ensure => installed })

  Package <| |> -> Bundle::Install <| |>
  Package <| |> -> Bundle::Exec <| |>
}
