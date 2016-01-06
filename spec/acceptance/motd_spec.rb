require 'spec_helper_acceptance'

describe 'static message from content' do
  it do
    pp = <<-EOS
      class { motd:
        content => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'Windows'
    describe file('/etc/motd') do
      it { is_expected.to be_file }
      it { should contain "Hello world!\n" }
    end
  end

  # Check that dynamic motd settings are unchanged on Debian.
  if fact('osfamily') == 'Debian'
    describe file('/etc/pam.d/sshd') do
      if (fact('operatingsystem') == 'Ubuntu' and fact('operatingsystemmajrelease').to_f > 12.10) or (fact('operatingsystem') == 'Debian' and fact('operatingsystemmajrelease').to_f > 6)
        its(:content) { should match /session    optional     pam_motd.so  motd=\/run\/motd.dynamic noupdate/ }
      end
      its(:content) { should match /session    optional     pam_motd.so # \[1\]/ }
    end
  end
end

describe 'static message from template' do
  it do
    pp = <<-EOS
      class { motd:
        template => "motd/spec.erb",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'Windows'
    describe file('/etc/motd') do
      it { is_expected.to be_file }
      it { should contain "Test Template for Rspec" }
    end
  end

  # Check that dynamic motd settings are unchanged on Debian.
  if fact('osfamily') == 'Debian'
    describe file('/etc/pam.d/sshd') do
      if (fact('operatingsystem') == 'Ubuntu' and fact('operatingsystemmajrelease').to_f > 12.10) or (fact('operatingsystem') == 'Debian' and fact('operatingsystemmajrelease').to_f > 6)
        its(:content) { should match /session    optional     pam_motd.so  motd=\/run\/motd.dynamic noupdate/ }
      end
      its(:content) { should match /session    optional     pam_motd.so # \[1\]/ }
    end
  end

end

describe 'disable dynamic motd settings on Debian', :if => fact('osfamily') == 'Debian' do
  it do
    pp = <<-EOS
      class { motd:
        content => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  describe file('/etc/motd') do
    it { is_expected.to be_file }
    it { should contain "Hello world!\n" }
  end

  # Check that dynamic motd settings are unchanged on Debian.
  if fact('osfamily') == 'Debian'
    describe file('/etc/pam.d/sshd') do
      if (fact('operatingsystem') == 'Ubuntu' and fact('operatingsystemmajrelease').to_f > 12.10) or (fact('operatingsystem') == 'Debian' and fact('operatingsystemmajrelease').to_f > 6)
        its(:content) { should match /session    optional     pam_motd.so  motd=\/run\/motd.dynamic noupdate/ }
      end
      its(:content) { should match /session    optional     pam_motd.so # \[1\]/ }
    end
  end
end
