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


  if fact('osfamily') != 'windows'
    describe file('/etc/motd') do
      it { is_expected.to be_file }
      it { should contain "Hello world!\n" }
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


  if fact('osfamily') != 'windows'
    describe file('/etc/motd') do
      it { is_expected.to be_file }
      it { should contain "Test Template for Rspec" }
    end
  end
end

describe 'static message from content in /etc/issue' do
  it do
    pp = <<-EOS
      class { motd:
        issue_content => "Hello world!\n",
        content       => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'windows'
    describe file('/etc/issue') do
      it { is_expected.to be_file }
      it { should contain "Hello world!\n" }
    end
  end
end


describe 'static message from template in /etc/issue' do
  it do
    pp = <<-EOS
      class { motd:
        issue_template => "motd/spec.erb",
        content        => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'windows'
    describe file('/etc/issue') do
      it { is_expected.to be_file }
      it { should contain "Test Template for Rspec" }
    end
  end
end

describe 'static message from content in /etc/issue.net' do
  it do
    pp = <<-EOS
      class { motd:
        issue_net_content => "Hello world!\n",
        content           => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'windows'
    describe file('/etc/issue.net') do
      it { is_expected.to be_file }
      it { should contain "Hello world!\n" }
    end
  end
end


describe 'static message from template in /etc/issue.net' do
  it do
    pp = <<-EOS
      class { motd:
        issue_net_template => "motd/spec.erb",
        content            => "Hello world!\n",
      }
    EOS
    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end


  if fact('osfamily') != 'windows'
    describe file('/etc/issue.net') do
      it { is_expected.to be_file }
      it { should contain "Test Template for Rspec" }
    end
  end
end

describe 'disable dynamic motd settings on Debian', :if => fact('osfamily') == 'Debian' do
  it do
    pp = <<-EOS
      class { motd:
        dynamic_motd => false,
        content      => "Hello world!\n",
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
      its(:content) { should_not match /session    optional     pam_motd.so  motd=\/run\/motd.dynamic/ }
    end
  end
end
