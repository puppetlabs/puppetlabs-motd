source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development, :test do
  gem 'beaker-rspec',            :require => false
  gem 'rake',                    :require => false
  gem 'rspec-puppet',            :require => false
  gem 'puppetlabs_spec_helper',  :require => false
  gem 'serverspec',              :require => false
  gem 'puppet-lint',             :require => false
  gem 'metadata-json-lint',      :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

if RUBY_VERSION < '2.0'
  gem 'mime-types', '<3.0', :require => false
end

group :system_tests do
  if beaker_version = ENV['BEAKER_VERSION']
    gem 'beaker', *location_for(beaker_version)
  end
  gem 'beaker-puppet_install_helper', :require => false
  gem 'master_manipulator', '1.1.2',  :require => false
end

# vim:ft=ruby
