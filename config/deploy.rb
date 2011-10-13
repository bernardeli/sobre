require 'bundler/capistrano'

set :application, "sobre"
set :user, "deploy"
set :domain, "cpro5216.publiccloud.com.br"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, false
set :branch, "master"
set :keep_releases, 5

set :default_environment, {
  'RUBY_VERSION' => '1.9.2p0',
  "PATH"         => "/var/lib/gems/1.9.1/bin:/home/deploy/bin:/usr/local/bin:/usr/bin:/bin",
  "GEM_PATH"     => "/var/lib/gems/1.9.1/gems",
  "GEM_HOME"     => "/var/lib/gems/1.9.1",
  "BUNDLE_PATH"  => "/var/lib/gems/1.9.1/gems",
  "RAILS_ENV"    => "production"
}

set :scm, :git
set :repository, "git@github.com:bernardelli/sobre.git"
set :deploy_via, :remote_cache

role :web, domain
role :app, domain
role :db, domain, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

 task :symlink_config do
   run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
 end
end

#namespace :god do
# def god_is_running
#   !capture("#{god_command} status >/dev/null 2>/dev/null || echo 'not running'").start_with?('not running')
# end
#
# def god_command
#   "cd #{current_path}; god"
# end
#
# desc "Stop god"
# task :terminate_if_running do
#   if god_is_running
#     run "#{god_command} terminate"
#   end
# end
#
# desc "Start god"
# task :start do
#   config_file = "#{current_path}/config/god/resque.god"
#   environment = { :RAILS_ENV => rails_env, :RAILS_ROOT => current_path }
#   run "#{god_command} -c #{config_file}", :env => environment
# end
#end
#
#before "deploy:update", "god:terminate_if_running"
#after "deploy:update", "god:start"

before "deploy:assets:precompile", "deploy:symlink_config"
