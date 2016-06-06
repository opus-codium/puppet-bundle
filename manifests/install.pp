define bundle::install (
  $deployment = true,
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
    $with_arg = '--with ' + join($with, ' ')
  }

  if empty($without) {
    $without_arg = ''
  } else {
    $without_arg = '--without ' + join($without, ' ')
  }

  exec { "${name}% bundle install":
    command     => "${::bundler::command} install ${deployment_arg} ${with_arg} ${without_arg}",
    cwd         => $name,
    refreshonly => true,
  }
}
