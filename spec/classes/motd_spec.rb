# frozen_string_literal: true

require 'spec_helper'

describe 'motd', type: :class do
  describe 'On a non-linux system' do
    let(:facts) do
      {
        kernel: 'Unknown',
        os: {
          name: 'Unknown',
          family: 'Unknown',
          architecture: 'Unknown',
          release: {
            major: 'Unknown'
          }
        },
        memory: {
          system: {
            available: 'Unknown'
          }
        },
        processors: {
          models: [
            'Unknown',
          ]
        }
      }
    end

    it 'does not fail' do
      expect(subject).not_to raise_error
    end

    it { is_expected.not_to contain_file('/etc/motd') }
    it { is_expected.not_to contain_file('/etc/issue') }
    it { is_expected.not_to contain_file('/etc/issue.net') }
  end

  describe 'On Linux' do
    let(:facts) { on_supported_os['redhat-9-x86_64'] }

    context 'when neither template or source are specified' do
      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file', backup: 'false',
          content: "RedHat 9.0 x86_64\n\nFQDN:         foo.example.com (10.109.1.2)\nProcessor:    Intel Xeon Processor (Cascadelake)\nKernel:       Linux\nMemory Size:  3.10 GiB\n",
          owner: 'root', group: 'root', mode: '0644'
        )
      end
    end

    context 'when both template and source are specified' do
      let(:params) do
        {
          content: 'Hello!',
          template: 'motd/spec.epp'
        }
      end

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a source is specified' do
      let(:params) { { content: 'Hello!' } }

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when an external template is specified' do
      let(:params) { { template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a template is specified for /etc/issue' do
      let(:params) { { issue_template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/issue').with(
          ensure: 'file', backup: 'false',
          content: "Test Template for Rspec\n",
          owner: 'root', group: 'root', mode: '0644'
        )
      end
    end

    context 'when content is specified for /etc/issue' do
      let(:params) { { issue_content: 'Hello!' } }

      it do
        expect(subject).to contain_File('/etc/issue').with(
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
          issue_template: 'motd/spec.epp'
        }
      end

      it do
        expect(subject).to contain_File('/etc/issue').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a template is specified for /etc/issue.net' do
      let(:params) { { issue_net_template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/issue.net').with(
          ensure: 'file', backup: 'false',
          content: "Test Template for Rspec\n",
          owner: 'root', group: 'root', mode: '0644'
        )
      end
    end

    context 'when content is specified for /etc/issue.net' do
      let(:params) { { issue_net_content: 'Hello!' } }

      it do
        expect(subject).to contain_File('/etc/issue.net').with(
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
          issue_net_template: 'motd/spec.epp'
        }
      end

      it do
        expect(subject).to contain_File('/etc/issue.net').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end
  end

  describe 'On Debian based Operating Systems' do
    let(:facts) { on_supported_os['debian-11-x86_64'] }

    context 'when dynamic motd is false' do
      let(:params) { { dynamic_motd: false } }

      it { is_expected.to contain_file_line('dynamic_motd').with_line('session    optional     pam_motd.so  motd=/run/motd.dynamic') }
    end

    context 'when dynamic motd is true' do
      let(:params) { { dynamic_motd: true } }

      it { is_expected.not_to contain_file_line('dynamic_motd') }
    end
  end

  describe 'On Windows' do
    let(:facts) { on_supported_os['windows-10-x86_64'] }

    context 'when neither template or source are specified' do
      it do
        expect(subject).to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext').with(
          ensure: 'present',
          type: 'string',
          data: "windows 10 x64\n\nFQDN:         foo.example.com (10.138.1.5)\nProcessor:    Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz\nKernel:       windows\nMemory Size:  14.34 GiB\n",
        )
      end
    end

    context 'when content is specified' do
      let(:params) do
        {
          content: 'Hello!',
          windows_motd_title: 'This is the title.'
        }
      end

      it do
        expect(subject).to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext').with(
          ensure: 'present',
          type: 'string',
          data: 'Hello!',
        )
      end

      it do
        expect(subject).to contain_Registry_value('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticecaption').with(
          ensure: 'present',
          type: 'string',
          data: 'This is the title.',
        )
      end
    end
  end

  describe 'On FreeBSD' do
    # let(:facts) { on_supported_os['freebsd-12-amd64'] }
    let :facts do
      {
        kernel: 'FreeBSD',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        os: {
          name: 'FreeBSD',
          family: 'FreeBSD',
          architecture: 'amd64',
          release: {
            full: '11',
            major: '11'
          }
        },
        networking: {
          fqdn: 'test.example.com',
          ip: '123.23.243.1'
        },
        memory: {
          system: {
            available: '16.00 GB'
          }
        },
        processors: {
          models: [
            'intel',
          ]
        }
      }
    end

    context 'when neither template or source are specified' do
      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "FreeBSD 11 amd64\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    intel\nKernel:       FreeBSD\nMemory Size:  16.00 GB\n",
        )
      end
    end

    context 'when both template and source are specified' do
      let(:params) do
        {
          content: 'Hello!',
          template: 'motd/spec.epp'
        }
      end

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end

    context 'when a source is specified' do
      let(:params) { { content: 'Hello!' } }

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: 'Hello!',
        )
      end
    end

    context 'when an external template is specified' do
      let(:params) { { template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file',
          backup: 'false',
          content: "Test Template for Rspec\n",
        )
      end
    end
  end

  describe 'On AIX' do
    # let(:facts) { on_supported_os['aix-7.1-power'] }
    let :facts do
      {
        kernel: 'AIX',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        os: {
          name: 'AIX',
          family: 'AIX',
          architecture: 'PowerPC_POWER8',
          release: {
            full: '7100-04-02-1614'
          }
        },
        networking: {
          fqdn: 'test.example.com',
          ip: '123.23.243.1'
        },
        memory: {
          system: {
            available: '16.00 GB'
          }
        },
        processors: {
          models: [
            'PowerPC_POWER8',
          ]
        }
      }
    end

    context 'when neither template or source are specified' do
      it do
        expect(subject).to contain_File('/etc/motd').with(
          ensure: 'file', backup: 'false',
          content: "AIX 7100-04-02-1614 PowerPC_POWER8\n\nFQDN:         test.example.com (123.23.243.1)\nProcessor:    \PowerPC_POWER8\nKernel:       AIX\nMemory Size:  16.00 GB\n",
          owner: 'bin', group: 'bin', mode: '0644'
        )
      end
    end

    context 'when a template is specified for /etc/issue' do
      let(:params) { { issue_template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/issue').with(
          ensure: 'file', backup: 'false',
          content: "Test Template for Rspec\n",
          owner: 'bin', group: 'bin', mode: '0644'
        )
      end
    end

    context 'when a template is specified for /etc/issue.net' do
      let(:params) { { issue_net_template: 'motd/spec.epp' } }

      it do
        expect(subject).to contain_File('/etc/issue.net').with(
          ensure: 'file', backup: 'false',
          content: "Test Template for Rspec\n",
          owner: 'bin', group: 'bin', mode: '0644'
        )
      end
    end
  end
end
