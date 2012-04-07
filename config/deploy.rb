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
set :repository, "git@github.com:bernardeli/sobre.git"
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

  task :precompile do
    run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
  end
end

after "deploy:update_code", "deploy:symlink_config"
