# frozen_string_literal: true

require 'spec_helper'

describe 'bundle::install' do
  # rubocop:disable RSpec/MultipleMemoizedHelpers
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      let(:title) { '/path/to/bundle' }

      let(:params) do
        {
          environment: custom_environment,
          path: path,
          user: 'deploy',
          with: with,
          without: without,
        }
      end
      let(:custom_environment) { [] }
      let(:path) { :undef }
      let(:with) { %w[single] }
      let(:without) { %w[one two three] }

      it { is_expected.to compile }

      case facts[:osfamily]
      when 'Debian'
        it do
          is_expected.to contain_exec('deploy@foo /path/to/bundle% /usr/bin/bundle install --deployment --with single --without one two three').with(
            command: '/usr/bin/bundle install --deployment --with single --without one two three',
            environment: [],
            user: 'deploy'
          )
        end

        context 'custom environment' do
          let(:custom_environment) { ['BUNDLER_GEMFILE=Gemfile.aarch64'] }

          it do
            is_expected.to contain_exec('deploy@foo /path/to/bundle% /usr/bin/bundle install --deployment --with single --without one two three').with(
              environment: ['BUNDLER_GEMFILE=Gemfile.aarch64']
            )
          end
        end

        context 'custom path' do
          let(:path) { 'vendor/bundle' }

          it do
            is_expected.to contain_exec('deploy@foo /path/to/bundle% /usr/bin/bundle install --deployment --path vendor/bundle --with single --without one two three').with(
              command: '/usr/bin/bundle install --deployment --path vendor/bundle --with single --without one two three',
              user: 'deploy'
            )
          end
        end
      end
    end
  end
  # rubocop:enable RSpec/MultipleMemoizedHelpers
end
