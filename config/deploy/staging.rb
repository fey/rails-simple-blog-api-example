set :branch, :master
set :rails_env, :production

namespace :deploy do
  desc 'reload the database with seed data'
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=PRODUCTION'
      end
    end
  end
end

namespace :deploy do
  desc 'run server'
  task :run do
    on roles(:all) do
      within current_path do
        with rails_env: :production do
          execute :bundle, :exec, 'server '
        end
      end
    end
  end
end
