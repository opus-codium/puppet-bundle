# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'bundle class' do
  it 'works idempotently with no errors' do
    options[:forge_host] = 'https://forge.puppet.com'
    shell('puppet module install puppetlabs-vcsrepo')

    pp = <<~MANIFEST
      package { 'build-essential':
        ensure => installed,
      }

      package { 'git':
        ensure => installed,
      }

      package { 'ruby-dev':
        ensure => installed,
      }

      user { 'deploy':
        ensure => present,
      }

      $bundle_directory = '/tmp/bundle-install-acceptance-test-directory'

      vcsrepo { $bundle_directory:
        ensure   => present,
        provider => 'git',
        source   => 'https://github.com/puppetlabs/facter.git',
        require  => Package['git'],
        user     => 'deploy',
      }

      ~> bundle::install { $bundle_directory:
        deployment => false,
        path       => "${bundle_directory}/vendor",
        without    => [
          "development",
        ],
        user       => 'deploy',
        require    => [
          Package['build-essential'],
          Package['ruby-dev'],
        ],
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
