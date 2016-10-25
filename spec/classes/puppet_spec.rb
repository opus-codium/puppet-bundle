require 'spec_helper'

describe 'bundle' do
  include_context 'facts'

  it { is_expected.to compile }
end
