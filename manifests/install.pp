define bundle::install (
  $cwd,
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

  if $with.any? {
    $with_arg = '--with ' + $with.join(' ')
  } else {
    $with_arg = ''
  }

  if $without.any? {
    $without_arg = '--without ' + $without.join(' ')
  } else {
    $without_arg = ''
  }

  exec { "${cwd}% bundle install":
    command     => "${::bundler::command} install ${deployment_arg} ${with_arg} ${without_arg}"
    cwd         => $cwd,
    refreshonly => true,
  }
}
