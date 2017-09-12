define bundle::install (
  Boolean $deployment = true,
  Array[String] $environment = [],
  String $group = 'root',
  Optional[String] $path = undef,
  String $user = 'root',
  Array[String] $with = [],
  Array[String] $without = [],
  Integer $timeout = 300,
) {
  require ::bundle

  if $deployment {
    $deployment_arg = '--deployment'
  } else {
    $deployment_arg = ''
  }

  if $path {
    $path_arg = "--path ${path}"
  } else {
    $path_arg = ''
  }

  if empty($with) {
    $with_arg = ''
  } else {
    $with_arg = join(['--with', join(any2array($with), ' ')], ' ')
  }

  if empty($without) {
    $without_arg = ''
  } else {
    $without_arg = join(['--without', join(any2array($without), ' ')], ' ')
  }

  $command = join(reject([$::bundle::command, 'install', $deployment_arg, $path_arg, $with_arg, $without_arg], '^$'), ' ')

  exec { "${user}@${::hostname} ${name}% ${command}":
    command     => $command,
    cwd         => $name,
    environment => $environment,
    timeout     => $timeout,
    unless      => "${::bundle::command} check",
    user        => $user,
    group       => $group,
  }
}
