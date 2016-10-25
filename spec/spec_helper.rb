require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.shared_context 'facts', shared_context: :metadata do
  let(:facts) do
    {
      operatingsystemrelease: '8.6',
      operatingsystemmajrelease: '8',
      osfamily: 'Debian',
      operatingsystem: 'Debian',
    }
  end
end
