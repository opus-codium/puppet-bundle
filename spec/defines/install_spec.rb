require 'spec_helper'

describe 'bundle::install' do
  include_context 'facts'

  let(:title) { '/path/to/bundle' }

  let(:params) do
    {
      path: path,
      user: 'deploy',
      with: with,
      without: without
    }
  end
  let(:path) { :undef }
  let(:with) { 'single' }
  let(:without) { %w(one two three) }

  it { is_expected.to compile }
  it do
    is_expected.to contain_exec('deploy@hostname /path/to/bundle% /usr/bin/bundle install').with(
      command: '/usr/bin/bundle install --deployment --with single --without one two three',
      user: 'deploy'
    )
  end

  context 'custom path' do
    let(:path) { 'vendor/bundle' }

    it do
      is_expected.to contain_exec('deploy@hostname /path/to/bundle% /usr/bin/bundle install').with(
        command: '/usr/bin/bundle install --deployment --path vendor/bundle --with single --without one two three',
        user: 'deploy'
      )
    end
  end
end
