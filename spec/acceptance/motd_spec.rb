require 'spec_helper_acceptance'

motd_file = '/etc/motd'

issue_file = '/etc/issue'

issue_net_file = '/etc/issue.net'

template_expected_content = 'Test Template for Rspec'

pp_static_content = <<-EOS
    class { motd:
      content => "Hello world!\n",
    }
  EOS

pp_static_template = <<-EOS
    class { motd:
      template => "motd/spec.erb",
    }
  EOS

pp_static_content_issue = <<-EOS
    class { motd:
      issue_content => "Hello world!\n",
      content       => "Hello world!\n",
    }
  EOS

pp_static_template_issue = <<-EOS
    class { motd:
      issue_template => "motd/spec.erb",
      content        => "Hello world!\n",
    }
  EOS

pp_static_content_issue_net = <<-EOS
    class { motd:
      issue_net_content => "Hello world!\n",
      content           => "Hello world!\n",
    }
  EOS

pp_static_template_issue_net = <<-EOS
    class { motd:
      issue_net_template => "motd/spec.erb",
      content            => "Hello world!\n",
    }
  EOS

pp_debian_dynamic = <<-EOS
    class { motd:
      dynamic_motd => false,
      content      => "Hello world!\n",
    }
  EOS

# @summary: Helper function to run common functionality of MOTD acceptance tests.
#           Applies the manifest twice, if not windows checks for file against expected contents.
#           If a Debian dynamic test bool is given as true, executes a test for that platform.
# @param [string]  pp:                  Class MOTD definition to be tested
# @param [string]  expected_contain:    Expected contents of the MOTD file to be compared
# @param [string]  filename:            MOTD file to be tested
# @param [boolean] debian_dynamic_test: If true this runs a Debian test to check /etc/pam.d/sshd contents
def test_motd(pp, expected_contain, filename, debian_dynamic_test = false)
  # Run it twice and test for idempotency
  apply_manifest(pp, catch_failures: true)
  apply_manifest(pp, catch_changes: true)

  return unless fact('osfamily') != 'windows'
  expect(file(filename)).to be_file
  expect(file(filename)).to contain expected_contain

  return unless debian_dynamic_test
  describe file('/etc/pam.d/sshd') do
    its(:content) { is_expected.not_to match %r{session    optional     pam_motd.so  motd=/run/motd.dynamic} }
  end
end

describe 'Message of the day' do
  context 'static message from content' do
    it do
      test_motd(pp_static_content, "Hello world!\n", motd_file)
    end
  end

  context 'static message from template' do
    it do
      test_motd(pp_static_template, template_expected_content, motd_file)
    end
  end

  context 'static message from content in /etc/issue' do
    it do
      test_motd(pp_static_content_issue, "Hello world!\n", issue_file)
    end
  end

  context 'static message from template in /etc/issue' do
    it do
      test_motd(pp_static_template_issue, template_expected_content, issue_file)
    end
  end

  context 'static message from content in /etc/issue.net' do
    it do
      test_motd(pp_static_content_issue_net, "Hello world!\n", issue_net_file)
    end
  end

  context 'static message from template in /etc/issue.net' do
    it do
      test_motd(pp_static_template_issue_net, template_expected_content, issue_net_file)
    end
  end

  context 'disable dynamic motd settings on Debian', if: fact('osfamily') == 'Debian' do
    it do
      test_motd(pp_debian_dynamic, "Hello world!\n", motd_file, true)
    end
  end
end
