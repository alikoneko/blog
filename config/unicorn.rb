# config/unicorn.rb
env = ENV["RAILS_ENV"] || "development"

worker_processes 2

preload_app true

deploy_to = "/opt/alineer_com"
current_directory = "#{deploy_to}/current"
working_directory current_directory
shared_path = "#{deploy_to}/shared"

pid "#{shared_path}/pids/unicorn.pid"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{current_directory}/Gemfile"
end

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid_file = "#{shared_path}/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid_file)
    old_pid = File.read(old_pid_file).to_i
    if server.pid != old_pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, old_pid)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
