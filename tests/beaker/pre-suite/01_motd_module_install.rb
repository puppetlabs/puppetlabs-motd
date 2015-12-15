test_name 'FM-3918 - C95871 - Install MOTD module'

step 'Install MOTD Module'
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))
staging = { :module_name => 'puppetlabs-motd' }
local = { :module_name => 'motd', :source => proj_root, :target_module_path => master['distmoduledir'] }

# in CI install from staging forge, otherwise from local
install_dev_puppet_module_on(master, options[:forge_host] ? staging : local)
