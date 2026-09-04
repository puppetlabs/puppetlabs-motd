# frozen_string_literal: true

# See moduleroot/Gemfile.erb for the full explanation: a module targets the Puppet, Inc.
# architecture by default and only opts into OpenVox by declaring an "openvox" requirement
# in its own metadata.json. This is the same, single source of truth the Gemfile already
# used to decide which syntax gem gets installed -- so it's trusted here unconditionally,
# the same way puppetlabs_spec_helper/rake_tasks is required unconditionally above. If the
# expected gem isn't actually installed (a stale Gemfile.lock, bundle install never run
# after a metadata.json change), this should fail loudly with a LoadError naming the exact
# missing file, not be silently swallowed into "rake syntax" just not existing.
def puppet_module?
  return true unless File.file?('metadata.json')

  require 'json'
  metadata = JSON.parse(File.read('metadata.json'))
  Array(metadata['requirements']).none? { |r| r['name'] == 'openvox' }
rescue JSON::ParserError
  true
end

require 'bundler'
require 'puppet_litmus/rake_tasks' if Gem.loaded_specs.key? 'puppet_litmus'
require 'puppetlabs_spec_helper/rake_tasks'
require(puppet_module? ? 'puppetlabs-syntax/tasks/puppetlabs-syntax' : 'puppet-syntax/tasks/puppet-syntax')
require 'puppet-strings/tasks' if Gem.loaded_specs.key? 'puppet-strings'

PuppetLint.configuration.send('disable_relative')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_140chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_single_quote_string_with_variables')
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.ignore_paths = [".vendor/**/*.pp", ".bundle/**/*.pp", "pkg/**/*.pp", "spec/**/*.pp", "tests/**/*.pp", "types/**/*.pp", "vendor/**/*.pp"]

