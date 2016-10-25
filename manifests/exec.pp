define bundle::exec (
  $command,
  $cwd,
  $group = 'root',
  $refreshonly = false,
  $timeout = 300,
  $user = 'root',
  $environment = [],
) {
  require ::bundle

  exec { "${user}@${::hostname} ${::bundle::command} exec ${command}":
    command     => "${::bundle::command} exec ${command}",
    cwd         => $cwd,
    environment => $environment,
    group       => $group,
    refreshonly => $refreshonly,
    timeout     => $timeout,
    user        => $user,
  }
}
