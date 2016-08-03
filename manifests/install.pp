define bundle::install (
  $deployment = true,
  $user = 'root',
  $with = [],
  $without = [],
  $timeout = 300,
) {
  require ::bundle

  if $deployment {
    $deployment_arg = '--deployment'
  } else {
    $deployment_arg = ''
  }

  if empty($with) {
    $with_arg = ''
  } else {
    $with_arg = join(['--with', join($with, ' ')], ' ')
  }

  if empty($without) {
    $without_arg = ''
  } else {
    $without_arg = join(['--without', join($without, ' ')], ' ')
  }

  exec { "${user}@${::hostname} ${name}% ${::bundle::command} install":
    command     => "${::bundle::command} install ${deployment_arg} ${with_arg} ${without_arg}",
    cwd         => $name,
    refreshonly => true,
    user        => $user,
    timeout     => $timeout,
  }
}
