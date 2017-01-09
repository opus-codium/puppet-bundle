define bundle::install (
  $deployment = true,
  $environment = [],
  $path = undef,
  $user = 'root',
  $with = [],
  $without = [],
  $timeout = 300,
) {
  require ::bundle

  validate_array($environment)

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

  exec { "${user}@${::hostname} ${name}% ${::bundle::command} install":
    command     => join(reject([$::bundle::command, 'install', $deployment_arg, $path_arg, $with_arg, $without_arg], '^$'), ' '),
    cwd         => $name,
    environment => $environment,
    refreshonly => true,
    user        => $user,
    timeout     => $timeout,
  }
}
