# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'go4usedcars'
set :repo_url, 'git@github.com:neeraji2it/go4usedcars.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
 set :scm, :git

# Default value for :format is :pretty
 set :format, :pretty

# Default value for :log_level is :debug
 set :log_level, :debug

# Default value for :pty is false
 set :pty, true

# Default value for :linked_files is []
 set :linked_files, %w{config/database.yml}
 # set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
 set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
 set :keep_releases, 3
 p "********************************************releases3"
namespace :deploy do
  desc 'Restart application'
  task :restart do
 p "********************************************restart app"
    on roles(:app), in: :sequence, wait: 5 do
    #Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc "Update the crontab file"
  task :update_crontab do
 p "********************************************crontab1"
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
 p "********************************************crontab2"
         execute "whenever --update-crontab #{release_path}"
        end
      end
    end
  end
 after :publishing, "deploy:restart"
 after "deploy:restart", "deploy:update_crontab"
 after "deploy:update_crontab", "deploy:restart"
end