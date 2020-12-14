# @summary Run a command in a bundle
#
# @param command The command to run
# @param cwd Working directory to run the command from
# @param group Group to run the command as
# @param refreshonly Only run the command if the resource is signaled
# @param timeout Timeout for command execution
# @param user User to run the command as
# @param environment Environment variables to set before running the command
define bundle::exec (
  Optional[String] $command = undef,
  Optional[String] $cwd = undef,
  String $group = 'root',
  Boolean $refreshonly = false,
  Integer $timeout = 300,
  String $user = 'root',
  Array[String] $environment = [],
) {
  include bundle

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

  exec { "${user}@${facts.get('networking.hostname')} ${real_cwd}% ${bundle::command} exec ${real_command}":
    command     => "${bundle::command} exec ${real_command}",
    cwd         => $real_cwd,
    environment => $environment,
    group       => $group,
    refreshonly => $refreshonly,
    timeout     => $timeout,
    user        => $user,
  }
}
