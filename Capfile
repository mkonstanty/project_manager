load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require 'mongrel_cluster/recipes'


load 'config/deploy'
load 'lib/cap_recipes'
