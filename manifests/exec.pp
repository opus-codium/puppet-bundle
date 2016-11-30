define bundle::exec (
  $command = undef,
  $cwd = undef,
  $group = 'root',
  $refreshonly = false,
  $timeout = 300,
  $user = 'root',
  $environment = [],
) {
  require ::bundle

  if $cwd {
    $real_cwd = $cwd
  } else {
    $real_cwd = inline_template('<%= @title.split(":", 2)[0] %>')
  }

  if $command {
    $real_command = $command
  } else {
    $real_command = inline_template('<%= @title.split(":", 2)[1] %>')
  }

  exec { "${user}@${::hostname} ${real_cwd}% ${::bundle::command} exec ${real_command}":
    command     => "${::bundle::command} exec ${real_command}",
    cwd         => $real_cwd,
    environment => $environment,
    group       => $group,
    refreshonly => $refreshonly,
    timeout     => $timeout,
    user        => $user,
  }
}
