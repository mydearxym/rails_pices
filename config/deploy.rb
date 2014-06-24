require "rvm/capistrano"
require 'bundler/capistrano'

proj_name="ringgogo"

set :rvm_type, :system  # solve the bundler can't found problem
set :log_level, :debug
set :pty, true
set :default_shell, "/bin/bash -l"

set :application, "rails_pices"
set :repository,  "https://github.com/mydearxym/rails_pices.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "mydearxym" 
set :scm_password, "Woshiyingcai710" 

set :user, "root"
set :password, "luolongzhi123456"
set :deploy_to, "/usr/local/#{proj_name}"

server '115.29.138.203', :web, :app, :db , :primary => true

before 'deploy:setup', 'rvm:install_rvm' 
before 'deploy:setup', 'bundle upadte rake' 

#role :web, "115.29.138.203"                          # Your HTTP server, Apache/etc
#role :app, "115.29.138.203"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migratins will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
