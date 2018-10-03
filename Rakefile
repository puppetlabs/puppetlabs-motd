# frozen_string_literal: true
require 'pry'
require 'beaker/puppet_install_helper'
require 'beaker-puppet'
require 'bolt_spec/run'

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet_blacksmith/rake_tasks' if Bundler.rubygems.find_name('puppet-blacksmith').any?
require 'github_changelog_generator/task' if Bundler.rubygems.find_name('github_changelog_generator').any?
require 'puppet_pot_generator/rake_tasks'

def changelog_user
  return unless Rake.application.top_level_tasks.include? 'changelog'
  returnVal = nil || JSON.load(File.read('metadata.json'))['author']
  raise _('unable to find the changelog_user in .sync.yml, or the author in metadata.json') if returnVal.nil?
  puts "GitHubChangelogGenerator user:#{returnVal}"
  returnVal
end

def changelog_project
  return unless Rake.application.top_level_tasks.include? 'changelog'
  returnVal = nil || JSON.load(File.read('metadata.json'))['name']
  raise _('unable to find the changelog_project in .sync.yml or the name in metadata.json') if returnVal.nil?
  puts "GitHubChangelogGenerator project:#{returnVal}"
  returnVal
end

def changelog_future_release
  return unless Rake.application.top_level_tasks.include? 'changelog'
  returnVal = JSON.load(File.read('metadata.json'))['version']
  raise _('unable to find the future_release (version) in metadata.json') if returnVal.nil?
  puts "GitHubChangelogGenerator future_release:#{returnVal}"
  returnVal
end

PuppetLint.configuration.send('disable_relative')

if Bundler.rubygems.find_name('github_changelog_generator').any?
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    raise _("Set CHANGELOG_GITHUB_TOKEN environment variable eg 'export CHANGELOG_GITHUB_TOKEN=valid_token_here'") if Rake.application.top_level_tasks.include?('changelog') && ENV['CHANGELOG_GITHUB_TOKEN'].nil?
    config.user = changelog_user.to_s
    config.project = changelog_project.to_s
    config.future_release = changelog_future_release.to_s
    config.exclude_labels = ['maintenance']
    config.header = "# Change log\n\nAll notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org)."
    config.add_pr_wo_labels = true
    config.issues = false
    config.merge_prefix = '### UNCATEGORIZED PRS; GO LABEL THEM'
    config.configure_sections = {
      'Changed' => {
        'prefix' => '### Changed',
        'labels' => ['backwards-incompatible'],
      },
      'Added' => {
        'prefix' => '### Added',
        'labels' => ['feature', 'enhancement'],
      },
      'Fixed' => {
        'prefix' => '### Fixed',
        'labels' => ['bugfix'],
      },
    }
  end
else
  desc 'Generate a Changelog from GitHub'
  task :changelog do
    raise <<EOM
The changelog tasks depends on unreleased features of the github_changelog_generator gem.
Please manually add it to your .sync.yml for now, and run `pdk update`:
---
Gemfile:
  optional:
    ':development':
      - gem: 'github_changelog_generator'
        git: 'https://github.com/skywinder/github-changelog-generator'
        ref: '20ee04ba1234e9e83eb2ffb5056e23d641c7a018'
        condition: "Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new('2.2.2')"
EOM
  end
end

desc "provision machines - vmpooler eg `bundle exec rake 'provision[ubuntu-1604-x86_64]`"
task :provision, [:platform] do |task, args|
  platform = if args[:platform].nil?
               'ubuntu-1604-x86_64'
             else
               args[:platform]
            end
  puts "Using VMPooler for #{platform}"
  vmpooler = Net::HTTP.start(ENV['VMPOOLER_HOST'] || 'vmpooler.delivery.puppetlabs.net')

  reply = vmpooler.post("/api/v1/vm/#{platform}", '')
  raise "Error: #{reply}: #{reply.message}" unless reply.is_a?(Net::HTTPSuccess)

  data = JSON.parse(reply.body)
  raise "VMPooler is not ok: #{data.inspect}" unless data['ok'] == true

  hostname = "#{data[platform]['hostname']}.#{data['domain']}"
  puts "reserved #{hostname} in vmpooler"
end
desc 'pre_setup - disable apt / configure firewall'
task :pre_setup do
  puts 'pre_setup'
end
desc 'install puppet - PE / FOSS / Bolt'
task :install_puppet, [:hostname] do |task, args|
  puts 'install_puppet'
  config_data = {
      "ssh" =>  { "host-key-check" => false },
      "winrm" => { "ssl" => false } }
  include BoltSpec::Run
  result = run_command('wget https://apt.puppetlabs.com/puppet5-release-xenial.deb', args[:hostname], config: config_data)
puts result
  result = run_command('dpkg -i puppet5-release-xenial.deb', args[:hostname], config: config_data)
puts result
  result = run_command('apt update', args[:hostname], config: config_data)
puts result
  result = run_command('apt-get install puppet-agent -y', args[:hostname], config: config_data)
puts result
end

desc 'pre-test - build and install module'
task :pre_test, [:hostname] do |task, args|
  puts 'pre_test'
  include BoltSpec::Run
  `pdk build  --force`
  puts 'built'
  config_data = {
      "ssh" =>  { "host-key-check" => false },
      "winrm" => { "ssl" => false } }
  `scp pkg/puppetlabs-motd-2.0.0.tar.gz root@#{args[:hostname]}:/tmp`
  result = run_command('/opt/puppetlabs/puppet/bin/puppet module install /tmp/puppetlabs-motd-2.0.0.tar.gz', args[:hostname], config: config_data)
  puts result
end
desc 'snapshot - allow rollbacks in vmpooler / vagrant'
task :snapshot do
  puts 'snapshot'
end
desc 'test - run rspec / inspec / serverspec / puppet code as tests'
task :test do
  puts 'test'
end
desc 'tear-down - decommission machines'
task :tear_down do
  puts 'tear_down'
end
