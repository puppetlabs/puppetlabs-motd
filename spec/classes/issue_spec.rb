require 'spec_helper'

describe 'motd::issue', type: :class do
  describe 'On Linux' do
    let(:facts) do
      {
        kernel: 'Linux',
        operatingsystem: 'TestOS',
        osfamily: 'Debian',
        memoryfree: '1 KB',
        domain: 'testdomain'
      }
    end
    context 'When nothing is specified' do
      it do
        should contain_File('/etc/issue').with(
          ensure: 'file',
          content: 'puppet:///modules/motd/issue'
        )
        should contain_File('/etc/issue.net').with(
          ensure: 'file',
          content: nil,
          source: 'file:///etc/issue'
        )
      end
    end

    context 'When content is specified' do
      let(:params) do
        {
          content: 'Hello!'
        }
      end
      it do
        should contain_File('/etc/issue').with(
          ensure: 'file',
          content: 'Hello!'
        )
      end
    end

    context 'When link_to_issue is true' do
      let(:params) do
        {
          link_to_issue: true,
        }
      end
      it do
        should contain_File('/etc/issue').with(
          ensure: 'file',
          content: 'puppet:///modules/motd/issue'
        )
        should contain_File('/etc/issue.net').with(
          ensure: 'file',
          source: 'file:///etc/issue'
        )
      end
    end

    context 'When link_to_issue is false and net_content is specified' do
      let(:params) do
        {
          link_to_issue: false,
          net_content: 'Hello!'
        }
      end
      it do
        should contain_File('/etc/issue').with(
          ensure: 'file',
          content: 'puppet:///modules/motd/issue'
        )
        should contain_File('/etc/issue.net').with(
          ensure: 'file',
          source: nil,
          content: 'Hello!'
        )
      end
    end

    context 'When link_to_issue is false and net_content is not specified' do
      let(:params) do
        {
          link_to_issue: false,
        }
      end
      it do
        expect{ is_expected.to compile }.to raise_error(/needs to be provided/)
      end
    end

  end

end
