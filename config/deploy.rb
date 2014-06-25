require "rvm/capistrano"
require 'bundler/capistrano'


$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

proj_name="ringgogo"

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system  # solve the bundler can't found problem
set :log_level, :debug
set :pty, true
set :default_shell, "/bin/bash -l"

set :application, "rails_pices"
set :repository,  "https://github.com/mydearxym/rails_pices.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, 'master'
set :scm_username, "mydearxym" 
set :scm_password, "Woshiyingcai710" 

set :user, "root"
set :password, "luolongzhi123456"
set :deploy_to, "/usr/local/#{proj_name}"

server '115.29.138.203', :web, :app, :db , :primary => true


namespace :deploy do 
    desc "@@@ mkdir a dir log Cap, or will trigger error"
    task :create_log_share do
        run "mkdir -p #{shared_path}/log"
        # run "apt-get install ruby-bundler"
    end

    desc "@@@ installl the bundler"
    task :install_bundler do
        run "cd /usrl/local/#{proj_name}; bundle "
    end

    desc "@@@ use ruby 1.9.3"
    task :use_1_9_3 do
        run "rvm use 1.9.3"
    end

    desc "@@@ rewirte migrate"
    task :migrate do
        puts "@@@ now migrate the db ..."
        # default migrate case tags gem problem
        run "cd #{release_path}; bundle exec rake db:migrate"
    end

    desc "@@@ restart "
    task :restart do
        puts "@@@ now restart the server ..."
        puts "@@@ now stop ..."
        run "kill -9 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
        puts "@@@ now start ..."
        run "cd #{deploy_to}/current/; bundle exec unicorn_rails -c config/unicorn.rb -D"
        puts "@@@ restart over ..."
    end
end

before 'deploy:setup', "deploy:create_log_share"
after 'deploy:update_code', 'deploy:migrate'


# before 'deplay:cold', "deploy:use_1_9_3"
# after 'deplay:cold', "deploy:install_bundler"


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
