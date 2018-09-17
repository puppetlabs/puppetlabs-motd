require 'spec_helper_acceptance'

motd_file = '/etc/motd'

issue_file = '/etc/issue'

issue_net_file = '/etc/issue.net'

template_expected_content = 'Test Template for Rspec'

pp_static_content = <<-PUPPETCODE
    class { motd:
      content => "Hello world!\n",
    }
PUPPETCODE

pp_static_template = <<-PUPPETCODE
    class { motd:
      template => "motd/spec.epp",
    }
PUPPETCODE

pp_static_content_issue = <<-PUPPETCODE
    class { motd:
      issue_content => "Hello world!\n",
      content       => "Hello world!\n",
    }
PUPPETCODE

pp_static_template_issue = <<-PUPPETCODE
    class { motd:
      issue_template => "motd/spec.epp",
      content        => "Hello world!\n",
    }
PUPPETCODE

pp_static_content_issue_net = <<-PUPPETCODE
    class { motd:
      issue_net_content => "Hello world!\n",
      content           => "Hello world!\n",
    }
PUPPETCODE

pp_static_template_issue_net = <<-PUPPETCODE
    class { motd:
      issue_net_template => "motd/spec.epp",
      content            => "Hello world!\n",
    }
PUPPETCODE

pp_debian_dynamic = <<-PUPPETCODE
    class { motd:
      dynamic_motd => false,
      content      => "Hello world!\n",
    }
PUPPETCODE

# @summary: Helper function to run common functionality of MOTD acceptance tests.
#           Applies the manifest twice, if not windows checks for file against expected contents.
#           If a Debian dynamic test bool is given as true, executes a test for that platform.
# @param [string]  pp:                  Class MOTD definition to be tested
# @param [string]  expected_contain:    Expected contents of the MOTD file to be compared
# @param [string]  filename:            MOTD file to be tested
def test_motd(pp, expected_contain, filename)
  # Run it twice and test for idempotency
  apply_manifest(pp, catch_failures: true)
  apply_manifest(pp, catch_changes: true)

  return unless fact('osfamily') != 'windows'
  expect(file(filename)).to be_file
  expect(file(filename)).to contain expected_contain
end

describe 'Message of the day' do
  context 'when static message from content' do
    it do
      test_motd(pp_static_content, "Hello world!\n", motd_file)
    end
  end

  context 'when static message from template' do
    it do
      test_motd(pp_static_template, template_expected_content, motd_file)
    end
  end

  context 'when static message from content in /etc/issue' do
    it do
      test_motd(pp_static_content_issue, "Hello world!\n", issue_file)
    end
  end

  context 'when static message from template in /etc/issue' do
    it do
      test_motd(pp_static_template_issue, template_expected_content, issue_file)
    end
  end

  context 'when static message from content in /etc/issue.net' do
    it do
      test_motd(pp_static_content_issue_net, "Hello world!\n", issue_net_file)
    end
  end

  context 'when static message from template in /etc/issue.net' do
    it do
      test_motd(pp_static_template_issue_net, template_expected_content, issue_net_file)
    end
  end

  context 'when disable dynamic motd settings on Debian', if: fact('osfamily') == 'Debian' do
    it do
      test_motd(pp_debian_dynamic, "Hello world!\n", motd_file)
    end
    describe file('/etc/pam.d/sshd') do
      its(:content) { is_expected.not_to match %r{session    optional     pam_motd.so  motd=/run/motd.dynamic} }
    end
  end
end
