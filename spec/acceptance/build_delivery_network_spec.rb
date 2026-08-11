# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'Network connectivity to build.delivery.puppetlabs.net' do
  it 'is reachable from the CI runner' do
    result = system('ping', '-c', '4', 'build.delivery.puppetlabs.net')

    expect(result).to be true
  end
end
