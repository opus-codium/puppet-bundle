require 'spec_helper'

describe 'bundle::exec' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      let(:title) { '/path/to/bundle:rake assets:precompile' }

      let(:params) do
        {
          command: command,
          cwd: cwd,
          user: 'deploy',
        }
      end
      let(:command) { :undef }
      let(:cwd) { :undef }

      it { is_expected.to compile }

      case facts[:osfamily]
      when 'Debian'
        it do
          is_expected.to contain_exec('deploy@foo /path/to/bundle% /usr/bin/bundle exec rake assets:precompile').with(
            command: '/usr/bin/bundle exec rake assets:precompile',
            cwd: '/path/to/bundle',
            user: 'deploy',
          )
        end

        context 'with explicit command and cwd' do
          let(:command) { 'rspec' }
          let(:cwd) { '/path/to/another/location' }

          it do
            is_expected.to contain_exec('deploy@foo /path/to/another/location% /usr/bin/bundle exec rspec').with(
              command: '/usr/bin/bundle exec rspec',
              cwd: '/path/to/another/location',
              user: 'deploy',
            )
          end
        end
      end
    end
  end
end
