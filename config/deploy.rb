require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :use_sudo, false

set :stages, ['production']
set :default_stage, 'production'

set :application, 'alineer_com'
set :repository, '.'
set :scm, :none
set :deploy_via, :copy
set :copy_exclude, ['.git', 'vendor', '.gitignore']

set :deploy_to, '/opt/alineer_com/'
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
set :keep_releases, 5

set :user, 'alineer_com'

after "deploy", "deploy:cleanup"

namespace :deploy do
  after 'bundle:install' do
    run "cd -- #{current_release} && bundle exec rake RAILS_ENV=production db:migrate"
  end

  task :start do
  end

  task :stop do
    run "kill -QUIT `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then sleep 3; kill -s USR2 `cat #{unicorn_pid}`; fi"
  end
end
