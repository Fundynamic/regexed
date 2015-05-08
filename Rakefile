# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Regexed::Application.load_tasks

namespace :regexed do
  task :setup => [:ensure_postgres_91, :ensure_user]

  desc 'Make sure postgres > 9.1 is installed'
  task :ensure_postgres_91 do
    version = `psql --version`
    raise "Please install postgres (> 9.1). Preferred way is to use: brew install postgres" unless version.include? "9"
  end

  desc 'Make sure postgres user exists'
  task :ensure_user do
    config = YAML.load_file("config/database.yml")[Rails.env]
    user_exists = `psql -h #{config["host"]} postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='#{config["username"]}'"`
    if !user_exists.nil? && user_exists.strip != "1"
      puts "Creating user #{config["username"]}"
      `psql -h #{config["host"]} postgres -c "create user #{config["username"]} with password '#{config["password"]}' SUPERUSER"`
    end
  end
end
