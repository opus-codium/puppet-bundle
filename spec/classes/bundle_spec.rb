require 'spec_helper'

describe 'bundle' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to compile }
    end
  end
end
