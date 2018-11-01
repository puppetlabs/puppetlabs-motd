require 'serverspec'
require 'solid_waffle'
include SolidWaffle

if ENV['TARGET_HOST'].nil?
  puts 'Running tests against this machine !'
else
  puts "TARGET_HOST #{ENV['TARGET_HOST']}"
  # load inventory
  inventory_hash = load_inventory_hash
  node_config = config_from_node(inventory_hash, ENV['TARGET_HOST'])

  if host_in_group(inventory_hash, ENV['TARGET_HOST'], 'ssh_nodes')
    set :backend, :ssh
    options = Net::SSH::Config.for(host)
    options[:user] = node_config.dig('ssh', 'user') unless node_config.dig('ssh', 'user').nil?
    options[:port] = node_config.dig('ssh', 'port') unless node_config.dig('ssh', 'port').nil?
    options[:password] = node_config.dig('ssh', 'password') unless node_config.dig('ssh', 'password').nil?
    host = ENV['TARGET_HOST']
    set :host,        options[:host_name] || host
    set :ssh_options, options
  elsif host_in_group(inventory_hash, ENV['TARGET_HOST'], 'winrm_nodes')
    require 'winrm'

    set :backend, :winrm
    set :os, :family => 'windows'
    user = node_config.dig('winrm', 'user') unless node_config.dig('winrm', 'user').nil?
    pass = node_config.dig('winrm', 'password') unless node_config.dig('winrm', 'password').nil?
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
