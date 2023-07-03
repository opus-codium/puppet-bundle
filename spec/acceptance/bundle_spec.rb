# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'bundle class' do
  it 'works idempotently with no errors' do
    pp = <<~MANIFEST
      class { 'bundle':
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
