require 'serverspec'
require 'solid_waffle'
include SolidWaffle

set :backend, :ssh

options = Net::SSH::Config.for(host)
options[:user] = 'root'
inventory_hash = load_inventory_hash
targets = find_targets(nil, inventory_hash)
host = targets.first.to_s

set :host,        options[:host_name] || host
set :ssh_options, options
