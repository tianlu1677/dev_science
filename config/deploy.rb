# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'scrinium'
set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to,  "/home/kkb/projects/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git
set :scm, :copy

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  task :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute " kill -USR2 `cat /home/kkb/projects/#{fetch(:application)}/current/tmp/pids/unicorn.pid` "
      # execute " ln -nfs /home/kkb/projects/#{fetch(:application)}/shared/public/uploads /home/kkb/projects/#{fetch(:application)}/current/public/uploads "
      #
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  after :publishing, :restart
  after :finishing, "deploy:cleanup"

end
