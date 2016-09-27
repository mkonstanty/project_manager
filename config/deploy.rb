set :user, "mkonstan"

set :application, "project_manager"
set :deploy_to, "/home/fizyka/mkonstan/#{application}/"


set :mongrel_servers, "1"
set :mongrel_port, "8031"
set :mongrel_address, "153.19.7.200"
set :mongrel_environment, "production"
set :mongrel_conf, "#{shared_path}/config/mongrel_cluster.yml"
set :mongrel_user, "#{user}"
set :mongrel_group, "fizyka"
set :mongrel_config_script, "#{shared_path}/config/mongrel.conf"

depend :remote, :gem, "mongrel", ">=1.1.5"
depend :remote, :gem, "mongrel_cluster", ">=1.0.5"



set :use_sudo, false

set :repository,  "git://manta.univ.gda.pl/~mkonstan/project_manager.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :export

role :app, "manta.univ.gda.pl"
role :web, "manta.univ.gda.pl"
role :db, "manta.univ.gda.pl", :primary => true

set :keep_releases, "4"

set :migrate_target, :latest

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
