define bundle::exec (
  $command,
  $cwd,
  $group = 'root',
  $refreshonly = false,
  $timeout = 300,
  $user = 'root',
  $environment = [],
) {
  include ::bundle

  exec { $name:
    command     => "${::bundle::command} exec ${command}",
    cwd         => $cwd,
    environment => $environment,
    group       => $group,
    timeout     => $timeout,
    user        => $user,
  }
}
