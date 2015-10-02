lock '3.4.0'

set :repo_url, 'https://github.com/aspushkinus/take_dat_shit.git'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

namespace :deploy do

  after :restart, :restart_passenger do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  after :finishing, 'deploy:restart_passenger'
end
