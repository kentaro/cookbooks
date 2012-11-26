set :user, ENV['USER'] || `whoami`

set :scm,       :git
set :repository '.'
set :deploy_to, '/tmp/chef'

namespace :chef do
  task :setup, :pty => true do
    sudo 'apt-get install ruby1.9.3'
    sudo 'gem install chef'
  end

  task :kentarok_org do
    sudo <<-"EOS", :pty => true
      chef-solo -c #{deploy_to}/current/config/solo.rb -j #{deploy_to}/current/config/kentarok.org.json
EOS
  end
end
