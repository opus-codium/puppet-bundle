define bundle::exec (
  $command,
  $cwd,
  $group = 'root',
  $refreshonly = false,
  $timeout = 300,
  $user = 'root',
  $environment = [],
  $refreshonly = false,
) {
  include ::bundle

  exec { $name:
    command     => "${::bundle::command} exec ${command}",
    cwd         => $cwd,
    environment => $environment,
    group       => $group,
    refreshonly => $refreshonly,
    timeout     => $timeout,
    user        => $user,
  }
}
