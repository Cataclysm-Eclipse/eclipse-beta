set :application, 'eclipse-beta'
set :repo_url, 'https://github.com/Cataclysm-Eclipse/eclipse-beta'

set :deploy_to, '/home/deploy/eclipse-beta'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rbenv_path, '/home/deploy/.rbenv/'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
