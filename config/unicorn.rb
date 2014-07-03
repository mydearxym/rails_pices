
# rails_env = ENV['RAILS_ENV'] || 'production'
rails_env = 'production'

app_path = "/usr/local/ringgogo/current"

# listen "/tmp/unicorn.ringgogo.sock"
listen "0.0.0.0:3003"
worker_processes 4

pid "#{app_path}/tmp/pids/unicorn.pid"
stderr_path "#{app_path}/log/unicorn.log"
stdout_path "#{app_path}/log/unicorn.log"

preload_app true
timeout 30

before_fork do |server, worker|
  old_pid = "#{app_path}/tmp/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts "Send 'QUIT' signal to unicorn error!"
    end
  end
end