require 'bundler/capistrano'

set :application, "sobre"

default_run_options[:pty] = true

set :repository,  "git@github.com:bernardelli/sobre.git"
set :scm, :git

set :bundle_cmd, '/var/lib/gems/1.9.1/bin/bundle'
set :user, 'root'
set :use_sudo, false
set :domain, 'cpro5216.publiccloud.com.br' # Your domain goes here
set :applicationdir, "/var/www/sobre"
set :deploy_to, applicationdir

role :web, domain
role :app, domain
role :db,  domain, :primary => true

set :chmod755, "app config db lib public vendor script script/* public/disp*"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
