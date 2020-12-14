require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.shared_context 'facts', shared_context: :metadata do
  let(:facts) do
    {
      networking: {
        hostname: 'hostname',
      },
      operatingsystemrelease: '8.6',
      osfamily: 'Debian',
      operatingsystem: 'Debian',
    }
  end
end
