require 'spec_helper'

describe 'motd', type: :class do
  describe 'On a non-linux system' do
    let(:facts) { { kernel: 'Unknown' } }

    it 'does not fail' do
      is_expected.not_to raise_error
    end
    it { is_expected.not_to contain_file('/etc/motd') }
    it { is_expected.not_to contain_file('/etc/issue') }
    it { is_expected.not_to contain_file('/etc/issue.net') }
  end

  describe 'On Linux' do
    let(:facts) do
      {
        kernel: 'Linux',
        operatingsystem: 'TestOS',
        operatingsystemrelease: 5,
        osfamily: 'Debian',
        architecture: 'x86_64',
        processor0: 'intel awesome',
        fqdn: 'test.example.com',
        ipaddress: '123.23.243.1',
        memoryfree: '1 KB',
      }
    end

    context 'when neither template or source are specified' do
      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "TestOS 5 x86_64\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    intel awesome\nKernel:       Linux\nMemory Free:  1 KB\n",
          owner:  'root',
          group:  'root',
          mode:   '0644',
        )
      end
    end

    context 'when both template and source are specified' do
      let(:params) do
        {
          content: 'Hello!',
          template: 'motd/spec.epp',
        }
      end

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a source is specified' do
      let(:params) { { content: 'Hello!' } }

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when an external template is specified' do
      let(:params) { { template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a template is specified for /etc/issue' do
      let(:params) { { issue_template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/issue').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
          owner:  'root',
          group:  'root',
          mode:   '0644',
        )
      end
    end

    context 'when content is specified for /etc/issue' do
      let(:params) { { issue_content: 'Hello!' } }

      it do
        is_expected.to contain_File('/etc/issue').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when both content and template is specified for /etc/issue' do
      # FIXME: duplicate behaviour described in FM-5956 until I'm allowed to fix it
      let(:params) do
        {
          issue_content: 'Hello!',
          issue_template: 'motd/spec.epp',
        }
      end

      it do
        is_expected.to contain_File('/etc/issue').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a template is specified for /etc/issue.net' do
      let(:params) { { issue_net_template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/issue.net').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
          owner:  'root',
          group:  'root',
          mode:   '0644',
        )
      end
    end

    context 'when content is specified for /etc/issue.net' do
      let(:params) { { issue_net_content: 'Hello!' } }

      it do
        is_expected.to contain_File('/etc/issue.net').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when both content and template is specified for /etc/issue.net' do
      # FIXME: duplicate behaviour described in FM-5956 until I'm allowed to fix it
      let(:params) do
        {
          issue_net_content: 'Hello!',
          issue_net_template: 'motd/spec.epp',
        }
      end

      it do
        is_expected.to contain_File('/etc/issue.net').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end
  end

  describe 'On Debian based Operating Systems' do
    let(:facts) do
      {
        kernel: 'Linux',
        operatingsystem: 'Debian',
        operatingsystemmajrelease: '7',
        osfamily: 'Debian',
      }
    end

    context 'when dynamic motd is false' do
      let(:params) { { dynamic_motd: false } }

      it { is_expected.to contain_file_line('dynamic_motd').with_line('session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate') }
    end

    context 'when dynamic motd is true' do
      let(:params) { { dynamic_motd: true } }

      it { is_expected.not_to contain_file_line('dynamic_motd') }
    end
  end
  describe 'On Windows' do
    let(:facts) do
      {
        kernel: 'windows',
        operatingsystem: 'TestOS',
        operatingsystemrelease: 5,
        osfamily: 'windows',
        architecture: 'x86_64',
        processor0: 'intel awesome',
        fqdn: 'test.example.com',
        ipaddress: '123.23.243.1',
        memoryfree: '1 KB',
      }
    end

    context 'when neither template or source are specified' do
      it do
        is_expected.to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext').with(
          ensure: 'present',
          type: 'string',
          data: "TestOS 5 x86_64\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    intel awesome\nKernel:       windows\nMemory Free:  1 KB\n",
        )
      end
    end
    context 'when content is specified' do
      let(:params) do
        {
          content: 'Hello!',
          windows_motd_title: 'This is the title.',
        }
      end

      it do
        is_expected.to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext').with(
          ensure: 'present',
          type: 'string',
          data: 'Hello!',
        )
        is_expected.to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticecaption').with(
          ensure: 'present',
          type: 'string',
          data: 'This is the title.',
        )
      end
    end
  end

  describe 'On FreeBSD' do
    let(:facts) do
      {
        kernel: 'FreeBSD',
        operatingsystem: 'TestOS',
        operatingsystemrelease: 11,
        osfamily: 'FreeBSD',
        architecture: 'amd64',
        processor0: 'intel',
        fqdn: 'test.example.com',
        ipaddress: '123.23.243.1',
        memoryfree: '1 KB',
      }
    end

    context 'when neither template or source are specified' do
      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "TestOS 11 amd64\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    intel\nKernel:       FreeBSD\nMemory Free:  1 KB\n",
        )
      end
    end

    context 'when both template and source are specified' do
      let(:params) do
        {
          content: 'Hello!',
          template: 'motd/spec.epp',
        }
      end

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a source is specified' do
      let(:params) { { content: 'Hello!' } }

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when an external template is specified' do
      let(:params) { { template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end
  end
  describe 'On AIX' do
    let(:facts) do
      {
        kernel: 'AIX',
        operatingsystem: 'AIX',
        operatingsystemrelease: '7100-04-02-1614',
        osfamily: 'AIX',
        architecture: 'PowerPC_POWER8',
        processor0: 'PowerPC_POWER8',
        fqdn: 'test.example.com',
        ipaddress: '123.23.243.1',
        memoryfree: '1 KB',
      }
    end

    context 'when neither template or source are specified' do
      it do
        is_expected.to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "AIX 7100-04-02-1614 PowerPC_POWER8\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    \PowerPC_POWER8\nKernel:       AIX\nMemory Free:  1 KB\n",
          owner:  'bin',
          group:  'bin',
          mode:   '0644',
        )
      end
    end
    context 'when a template is specified for /etc/issue' do
      let(:params) { { issue_template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/issue').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
          owner:  'bin',
          group:  'bin',
          mode:   '0644',
        )
      end
    end
    context 'when a template is specified for /etc/issue.net' do
      let(:params) { { issue_net_template: 'motd/spec.epp' } }

      it do
        is_expected.to contain_File('/etc/issue.net').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
          owner:  'bin',
          group:  'bin',
          mode:   '0644',
        )
      end
    end
  end
end
