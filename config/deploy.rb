require 'bundler/capistrano'

default_run_options[:pty] = true

set :application, "abrepo"
set :deploy_to, "/srv/www/#{application}"
set :repository,  "git@github.com:gmcclure/abrepo.git"
set :user, "gmcclure"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :default_environment, {
  'RBENV_ROOT' => '/home/gmcclure/.rbenv',
  'PATH' => '/home/gmcclure/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}

server "www.abrepo.com", :app, :web, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :setup_private_files do
    ["settings.yml"].each do |file|
      run "rm -rf #{release_path}/config/#{file}"
      run "cd #{release_path}/config && ln -sf #{shared_path}/settings/#{file} #{file}"
    end
  end
end

before "deploy:finalize_update", "deploy:setup_private_files"
