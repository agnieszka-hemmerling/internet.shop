$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'capistrano_colors'
require 'rvm/capistrano'
require 'bundler/capistrano'

set :use_sudo, false
set :rvm_ruby_string, '1.9.2@agma-shop.pl'
#set :rvm_type, :system

set :application, "Agma Shop"
set :repository,  "git@bitbucket.org:agnes1724/internet.shop.git"
set :scm, :git
set :user, 'agma-shop.pl'
set :deploy_via, :remote_cache
set :deploy_to, '/var/www/agma-shop.pl'
set :thin_config, 'agma-shop.pl.yml'

role :web, "agma-shop.pl"                          # Your HTTP server, Apache/etc
role :app, "agma-shop.pl"                          # This may be the same as your `Web` server
role :db,  "agma-shop.pl", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#set :deploy_via, :remote_cache


namespace :deploy do
  task :start do
    run "thin start -O -C /etc/thin/#{thin_config}"
  end
  task :stop do
    run "thin stop -O -C /etc/thin/#{thin_config}"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path}; bundle; bundle exec thin restart -O -C /etc/thin/#{thin_config}"
  end
end

=begin
  task :save_old_subject_thumbnails do
    run "cp #{previous_release}/public/uploads/subject/subject_thumbnail/* -a " +
    "#{release_path}/public/uploads/subject/subject_thumbnail/"
  end

  task :rescue_old_subject_thumbnails do
    run "#{release_path}/../releases/201*/public/uploads/subject/subject_thumbnail/* #{release_path}/public/uploads/subject/subject_thumbnail/ -a"
  end
end
=end

task :info do
  run "echo $(hostname)"
  run "ruby -v"
  run "rvm gemset list"
end


=begin
namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
=end
#after "deploy", "deploy:save_old_subject_thumbnails"
#after "deploy", "rvm:trust_rvmrc"
