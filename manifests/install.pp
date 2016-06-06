define bundle::install (
  $deployment = true,
  $user = 'root',
  $with = [],
  $without = [],
) {
  include ::bundle

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

  exec { "${name}% bundle install":
    command     => "${::bundle::command} install ${deployment_arg} ${with_arg} ${without_arg}",
    cwd         => $name,
    refreshonly => true,
    user        => $user,
  }
}
