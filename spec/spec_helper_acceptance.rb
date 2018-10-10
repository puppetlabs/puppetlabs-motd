require 'serverspec'
require 'solid_waffle'
include SolidWaffle

set :backend, :ssh

options = Net::SSH::Config.for(host)
options[:user] = 'root'
puts "TARGET_HOST #{ENV['TARGET_HOST']}"
host = ENV['TARGET_HOST']

set :host,        options[:host_name] || host
set :ssh_options, options
