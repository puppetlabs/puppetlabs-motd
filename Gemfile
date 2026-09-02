# frozen_string_literal: true

# For puppetcore, set GEM_SOURCE_PUPPETCORE = 'https://rubygems-puppetcore.puppet.com'
gemsource_default = ENV['GEM_SOURCE'] || 'https://rubygems.org'
gemsource_puppetcore = if ENV['PUPPET_FORGE_TOKEN']
  'https://rubygems-puppetcore.puppet.com'
else
  ENV['GEM_SOURCE_PUPPETCORE'] || gemsource_default
end
source gemsource_default

# A module targets the Puppet, Inc. architecture (puppetlabs-syntax, puppetlabs_spec_helper
# 9.x, and so on) by default. It only opts into the OpenVox architecture -- and the older
# gem generation that goes with it -- by explicitly declaring an "openvox" requirement in
# its own metadata.json. No requirement, or an explicit "puppet" requirement, both mean
# "puppet" architecture.
def puppet_module?
  return true unless File.file?('metadata.json')

  require 'json'
  metadata = JSON.parse(File.read('metadata.json'))
  Array(metadata['requirements']).none? { |r| r['name'] == 'openvox' }
rescue JSON::ParserError
  true
end

def location_for(place_or_constraint, fake_constraint = nil, opts = {})
  git_url_regex  = /\A(?<url>(?:https?|git)[:@][^#]*)(?:#(?<branch>.*))?/
  file_url_regex = %r{\Afile://(?<path>.*)}

  if place_or_constraint && (git_url = place_or_constraint.match(git_url_regex))
    # Git source → ignore :source, keep fake_constraint
    [fake_constraint, { git: git_url[:url], branch: git_url[:branch], require: false }].compact

  elsif place_or_constraint && (file_url = place_or_constraint.match(file_url_regex))
    # File source → ignore :source, keep fake_constraint or default >= 0
    [fake_constraint || '>= 0', { path: File.expand_path(file_url[:path]), require: false }]

  else
    # Plain version constraint → merge opts (including :source if provided)
    [place_or_constraint, { require: false }.merge(opts)]
  end
end

# Print debug information if DEBUG_GEMS or VERBOSE is set
def print_gem_statement_for(gems)
  puts 'DEBUG: Gem definitions that will be generated:'
  gems.each do |gem_name, gem_params|
    puts "DEBUG:   gem #{([gem_name.inspect] + gem_params.map(&:inspect)).join(', ')}"
  end
end

group :development do
  gem "json", '= 2.6.1',                  require: false if Gem::Requirement.create(['>= 3.1.0', '< 3.1.3']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "json", '= 2.6.3',                  require: false if Gem::Requirement.create(['>= 3.2.0', '< 4.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "json", '= 2.18.0',                 require: false if Gem::Requirement.create(['>= 4.0.0', '< 5.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "racc", '~> 1.4.0',                 require: false if Gem::Requirement.create(['>= 2.7.0', '< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "deep_merge", '~> 1.2.2',           require: false
  gem "facterdb", '~> 2.1',               require: false if Gem::Requirement.create(['< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "facterdb", '~> 3.0',               require: false if Gem::Requirement.create(['>= 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "metadata-json-lint", '~> 4.0',     require: false
  gem "json-schema", '< 5.1.1',           require: false
  gem "rspec-puppet-facts", '~> 4.0',     require: false if Gem::Requirement.create(['< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "rspec-puppet-facts", '~> 5.0',     require: false if Gem::Requirement.create(['>= 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "dependency_checker", '~> 1.0.0',   require: false
  gem "parallel_tests", '= 3.12.1',       require: false
  gem "pry", '~> 0.10',                   require: false
  gem "simplecov-console", '~> 0.9',      require: false
  gem "puppet-debugger", '~> 1.6',        require: false
  gem "rubocop", '~> 1.73.0',             require: false
  gem "rubocop-performance", '~> 1.24.0', require: false
  gem "rubocop-hash_inspect", '~> 0.2',   require: false
  gem "rubocop-rspec", '~> 3.5.0',        require: false
  gem "rubocop-rspec_rails", '~> 2.31.0', require: false
  gem "rubocop-factory_bot", '~> 2.27.0', require: false
  gem "rubocop-capybara", '~> 2.22.0',    require: false
  gem "rb-readline", '= 0.5.5',           require: false, platforms: [:windows]
  gem "bigdecimal", '< 3.2.2',            require: false, platforms: [:windows]
end
group :development, :release_prep do
  gem "puppet-strings", '>= 4.0', '< 6.0',     require: false
  gem "puppet-blacksmith", '>= 7.0', '< 10.0', require: false
end
group :system_tests do
  gem "puppet_litmus", '~> 2.5',   require: false
  gem "faraday", '~> 2.5',         require: false
  gem "CFPropertyList", '< 3.0.7', require: false if RUBY_PLATFORM.include?('darwin')
  gem "serverspec", '~> 2.41',     require: false
end

# See ADR 0001 (docs/adr/0001-*.md): every gem whose compatible version differs by
# puppet-vs-openvox architecture lives here, collected in one place. puppet_module? (defined
# above) decides live, on every bundle install/bundle exec, which side this module resolves
# to -- true unless this module's own metadata.json declares an "openvox" requirement.
if puppet_module?
  group :development do
    gem "voxpupuli-puppet-lint-plugins", '~> 7.0', require: false
  end
  group :development, :release_prep do
    gem "puppetlabs_spec_helper", '~> 9.0', require: false
  end
else
  group :development do
    gem "voxpupuli-puppet-lint-plugins", '~> 6.0', require: false
  end
  group :development, :release_prep do
    gem "puppetlabs_spec_helper", '~> 8.0', require: false
  end
end

gems = {}
bolt_version = ENV.fetch('BOLT_GEM_VERSION', nil)
# Puppet 8.17+ (available on puppetcore, not on public rubygems.org -- which tops out at
# 8.10.0) constrains multi_json's upper bound; leaving this fully unconstrained lets Bundler
# backtrack past that constraint to whatever older puppet release has no multi_json dependency
# at all if something else in the graph pulls in a newer multi_json -- resolving to an
# arbitrary old puppet (seen resolving as low as 8.13/8.16) instead of the latest 8.x. Floor it
# only when puppetcore is actually in play (PUPPET_FORGE_TOKEN set): public rubygems.org can't
# hit the buggy 8.17+ releases at all (they don't exist there), so forcing '~> 8.21' when
# resolving against it would just fail outright with no matching version. CI matrix cells that
# need a different Puppet line still set PUPPET_GEM_VERSION explicitly either way.
puppet_default_version = ENV['PUPPET_FORGE_TOKEN'] ? '~> 8.21' : nil
puppet_version = ENV.fetch('PUPPET_GEM_VERSION', puppet_default_version)
facter_version = ENV.fetch('FACTER_GEM_VERSION', nil)
hiera_version = ENV.fetch('HIERA_GEM_VERSION', nil)

gems['bolt'] = location_for(bolt_version, nil, { source: gemsource_puppetcore })
gems['puppet'] = location_for(puppet_version, nil, { source: gemsource_puppetcore })
gems['facter'] = location_for(facter_version, nil, { source: gemsource_puppetcore })
gems['hiera'] = location_for(hiera_version, nil, {}) if hiera_version

# Generate the gem definitions
print_gem_statement_for(gems) if ENV['DEBUG']
gems.each do |gem_name, gem_params|
  gem gem_name, *gem_params
end

# Evaluate Gemfile.local and ~/.gemfile if they exist
extra_gemfiles = [
  "#{__FILE__}.local",
  File.join(Dir.home, '.gemfile')
]

extra_gemfiles.each do |gemfile|
  next unless File.file?(gemfile) && File.readable?(gemfile)

  # rubocop:disable Security/Eval
  eval(File.read(gemfile), binding)
  # rubocop:enable Security/Eval
end
# vim: syntax=ruby
