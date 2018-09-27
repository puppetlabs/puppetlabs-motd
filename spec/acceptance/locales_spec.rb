require 'spec_helper_acceptance'

pp_template_content_error = <<-PUPPETCODE
    class { motd:
      content => "Hello world!\n",
      template => "motd/spec.epp",
    }
PUPPETCODE

pp_issue_error = <<-PUPPETCODE
    class { motd:
      issue_template => "motd/spec.epp",
      issue_content => "Hello world!\n",
      content       => "Hello world!\n",
    }
PUPPETCODE

pp_net_error = <<-PUPPETCODE
    class { motd:
      issue_net_template => "motd/spec.epp",
      issue_net_content => "Hello world!\n",
      content           => "Hello world!\n",
    }
PUPPETCODE

describe 'i18n Testing', if: (fact('osfamily') == 'Debian' || fact('osfamily') == 'RedHat') && (Gem::Version.new(puppet_version) >= Gem::Version.new('4.10.5')) do
  before :all do
    hosts.each do |host|
      on(host, "sed -i \"96i FastGettext.locale='ja'\" /opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet.rb")
      change_locale_on(host, 'ja_JP.utf-8')
    end
  end

  context 'when triggering simple errors' do
    it 'when passing both template and content parameters' do
      apply_manifest(pp_template_content_error, catch_failures: true) do |r|
        expect(r.stderr).to include('$templateパラメータと$contentパラメータの両方がmotdに渡され、contentは無視されました。')
      end
    end

    it 'when passing both issue_template and issue_content parameters' do
      apply_manifest(pp_issue_error, catch_failures: true) do |r|
        expect(r.stderr).to include('$issue_templateパラメータと$issue_contentパラメータの両方がmotdに渡され、issue_contentは無視されました。')
      end
    end

    it 'when passing both issue_net_template and issue_net_content parameters' do
      apply_manifest(pp_net_error, catch_failures: true) do |r|
        expect(r.stderr).to include('$issue_net_templateパラメータと$issue_net_contentパラメータの両方がmotdに渡され、issue_net_contentは無視されました。')
      end
    end
  end

  after :all do
    hosts.each do |host|
      on(host, 'sed -i "96d" /opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet.rb')
      change_locale_on(host, 'en_US')
    end
  end
end
