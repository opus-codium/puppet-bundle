# bundle

<!-- header GFM -->
[![Build Status](https://img.shields.io/github/actions/workflow/status/opus-codium/puppet-bundle/release.yml)](https://github.com/opus-codium/puppet-bundle/releases)
[![Puppet Forge](https://img.shields.io/puppetforge/v/opuscodium/bundle.svg)](https://forge.puppetlabs.com/opuscodium/bundle)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/opuscodium/bundle.svg)](https://forge.puppetlabs.com/opuscodium/bundle)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/opuscodium/bundle.svg)](https://forge.puppetlabs.com/opuscodium/bundle)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/opuscodium/bundle.svg)](https://forge.puppetlabs.com/opuscodium/bundle)
[![License](https://img.shields.io/github/license/opus-codium/puppet-bundle.svg)](https://github.com/voxpupuli/opuscodium-bundle/blob/master/LICENSE.md)
<!-- header -->

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Overview](#overview)
* [Module Description](#module-description)
* [Setup](#setup)
  * [What bundle affects](#what-bundle-affects)
  * [Beginning with bundle](#beginning-with-bundle)
* [Usage](#usage)
* [Reference](#reference)
* [Limitations](#limitations)
* [Contributing](#contributing)

<!-- vim-markdown-toc -->

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

## Limitations

The current implementation supports Debian GNU/Linux and FreeBSD.  Patches to
add support to more platforms are welcome.

## Contributing

1. Fork it ( https://github.com/opus-codium/puppet-bundle/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
