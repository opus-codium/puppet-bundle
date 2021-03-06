# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`bundle`](#bundle): Common code for bundler

### Defined types

* [`bundle::exec`](#bundleexec): Run a command in a bundle
* [`bundle::install`](#bundleinstall): Install a bundle

## Classes

### `bundle`

Common code for bundler

#### Parameters

The following parameters are available in the `bundle` class.

##### `package`

Data type: `String`

Name of the bundler package

##### `command`

Data type: `String`

Path to the bundler command

## Defined types

### `bundle::exec`

Run a command in a bundle

#### Parameters

The following parameters are available in the `bundle::exec` defined type.

##### `command`

Data type: `Optional[String]`

The command to run

Default value: ``undef``

##### `cwd`

Data type: `Optional[String]`

Working directory to run the command from

Default value: ``undef``

##### `group`

Data type: `String`

Group to run the command as

Default value: `'root'`

##### `refreshonly`

Data type: `Boolean`

Only run the command if the resource is signaled

Default value: ``false``

##### `timeout`

Data type: `Integer`

Timeout for command execution

Default value: `300`

##### `user`

Data type: `String`

User to run the command as

Default value: `'root'`

##### `environment`

Data type: `Array[String]`

Environment variables to set before running the command

Default value: `[]`

### `bundle::install`

Install a bundle

#### Parameters

The following parameters are available in the `bundle::install` defined type.

##### `deployment`

Data type: `Boolean`

Install the bundle in deployment mode

Default value: ``true``

##### `environment`

Data type: `Array[String]`

Environment to bundle the application with with

Default value: `[]`

##### `group`

Data type: `String`

Group to bundle the application with

Default value: `'root'`

##### `path`

Data type: `Optional[String]`

Custom path to bundle the application

Default value: ``undef``

##### `user`

Data type: `String`

User to bundle the application with

Default value: `'root'`

##### `with`

Data type: `Array[String]`

Pass --with when bundling the application

Default value: `[]`

##### `without`

Data type: `Array[String]`

Pass --without when bundling the application

Default value: `[]`

##### `timeout`

Data type: `Integer`

Timeout for bundling the application

Default value: `300`

