require 'beaker-rspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper
install_ca_certs_on default

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => module_root, :module_name => 'motd')
    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      if host['platform'] =~ /windows/i
        on host, puppet('module','install','puppetlabs-registry')
      end
    end
  end
end
