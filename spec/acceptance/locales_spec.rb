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
describe 'i18n Testing', unless: (os[:family] == 'windows') do
  before :all do
    run_shell("export LANGUAGE='ja'")
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
    run_shell("export LANGUAGE='en'")
  end
end
