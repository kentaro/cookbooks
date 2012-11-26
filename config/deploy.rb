set :user, ENV['USER'] || `whoami`

set :scm,        :git
set :repository, '.'
set :deploy_to,  '/tmp/chef'
set :deploy_via, :copy

set :use_sudo, false
set :default_run_options, :pty => true

task :setup do
  sudo 'apt-get update'
  sudo 'apt-get install -y build-essential git'
  deploy.setup
end

task :update do
  deploy.update
end

namespace :chef do
  task :setup do
    sudo 'apt-get install -y ruby1.9.3'
    sudo 'gem install chef --no-rdoc --no-ri'
  end

  %w(kentarok.org).each do |name|
    task name.to_sym do
      sudo <<-"EOS"
        chef-solo -c #{deploy_to}/current/config/solo.rb -j #{deploy_to}/current/config/#{name}.json
EOS
    end
  end
end
