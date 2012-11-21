root = "/home/ubuntu/apps/BatonTouch_Server/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.BatonTouch_Server.sock"
worker_processes 2
timeout 30
