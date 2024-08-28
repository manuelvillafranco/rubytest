lock "~> 3.16.0"

set :application, "myapp"
set :repo_url, "git@example.com:me/my_repo.git"
set :deploy_to, "/home/deploy/#{fetch(:application)}"

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :rvm_type, :user
set :rvm_ruby_version, '3.2.0'

set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_preload_app, true
set :puma_workers, 2
set :puma_threads, [4, 16]
