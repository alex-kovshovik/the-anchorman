server '192.241.209.22:3422', user: 'app', roles: %w{app db web}, my_property: :my_value
set :rvm_ruby_version, '2.2.3'

set :application, 'anchorman'
set :branch, 'v2'
set :deploy_to, "/srv/www/#{fetch(:application)}"
set :rails_env, "production"
