require 'serverspec'
require 'solid_waffle'
include SolidWaffle

if ENV['TARGET_HOST'].nil?
  puts 'Running tests against this machine !'
else
  puts "TARGET_HOST #{ENV['TARGET_HOST']}"
  # load inventory
  inventory_hash = load_inventory_hash
  if host_in_group(inventory_hash, ENV['TARGET_HOST'], 'ssh_nodes')
    set :backend, :ssh
    options = Net::SSH::Config.for(host)
    options[:user] = 'root'
    host = ENV['TARGET_HOST']
    set :host,        options[:host_name] || host
    set :ssh_options, options
  elsif host_in_group(inventory_hash, ENV['TARGET_HOST'], 'win_rm_nodes')
    require 'winrm'

    set :backend, :winrm
    set :os, :family => 'windows'
    user = 'Administrator'
    pass = 'Qu@lity!'
    endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"

    opts = {
       user: user,
       password: pass,
       endpoint: endpoint,
       operation_timeout: 300,
    }

    winrm = WinRM::Connection.new ( opts)
    Specinfra.configuration.winrm = winrm
  else
    raise "#{ENV['TARGET_HOST']} is not a member of any handled groups, check inventory.yaml"
  end
end
