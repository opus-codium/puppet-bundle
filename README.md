# bundle

[![Build Status](https://travis-ci.com/opus-codium/puppet-bundle.svg?branch=master)](https://travis-ci.com/opus-codium/puppet-bundle)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with bundle](#setup)
    * [What bundle affects](#what-bundle-affects)
    * [Beginning with bundle](#beginning-with-bundle)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Manage Ruby bundles using [bundler](http://bundler.io/).

## Module Description

This module installs bundler and aims at making it easy to manage Ruby
applications.

## Setup

### What bundle affects

* Installed packages;
* Installed gems (when `deployment` is set to `false`).

### Beginning with bundle

The following example deploys a fictive Rails application:

```puppet
$app_directory = '/var/www/app'

vcsrepo { $app_directory:
  ensure   => latest,
  provider => 'git',
  source   => 'git@example.com/repo.git',
  user     => 'deploy',
}

bundle::install { $app_directory:
  user  => 'deploy',
  group => 'deploy',
}

bundle::exec { "${app_directory}:rake db:migrate":
  user        => 'app',
  group       => 'app',
  environment => ['RAILS_ENV=production'],
  refreshonly => true,
}

exec { 'notify-app':
  command     => "/usr/bin/touch ${app_directory}/tmp/restart.txt",
  refreshonly => true,
}

Vcsrepo[$app_directory] ~>
Bundle::Install[$app_directory] ~>
Bundle::Exec["${app_directory}:rake db:migrate"] ~>
Exec['notify-app']
```

## Usage

Only the `bundle`, `bundle::install` and `bundle::exec` classes are intended to end users
usage. See reference documentation bellow.

## Reference

* [Public classes](#private-classes)
    * [`bundle`](#class-bundle)
* [Private classes](#private-classes)
    * [`bundle::params`](#class-bundleparams)
* [Defined Types](#defined-types)
    * [`bundle::exec`](#defined-type-bundleexec)
    * [`bundle::install`](#defined-type-bundleinstall)

### Public Classes

#### Class: `bundle`

Ensure bundler is installed.

### Private Classes

#### Class: `bundle::params`

Module parameters.

### Defined Types

#### Defined Type: `bundle::exec`

##### `command`

The command to execute within the bundle.  If not set, inferred from the resource's `$title` (everything after the first colon).

Default: undef

##### `cwd`

The directory fron which to run the bundle command.  If not set, inferred from the resource's `$title` (everything before the first colon).

Default: undef

##### `environment`

Environment variables to pass the bundle command.

Default: '[]'

##### `group`

Default: 'root'

##### `refreshonly`

Default: false

##### `timeout`

Default: '300'

##### `user`

Default: 'root'

#### Defined Type: `bundle::install`

##### `deployment`

Default: 'true'

##### `environment`

Default: '[]'

##### `path`

Default: 'undef'

##### `timeout`

Default: '300'

##### `user`

Default: 'root'

##### `with`

Default: '[]'

##### `without`

Default: '[]'

## Limitations

The current implementation supports Debian GNU/Linux and FreeBSD.  Patches to
add support to more platforms are welcome.

## Contributing

1. Fork it ( https://github.com/opus-codium/puppet-bundle/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
