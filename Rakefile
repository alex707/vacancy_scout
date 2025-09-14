require_relative 'config/boot'
require_relative 'db/config'
require 'sequel'
require 'sequel_tools'

config = Database::Config.get[ENV['RACK_ENV']]['primary']

namespace :db do
  SequelTools.inject_rake_tasks(
    {
      dbadapter: 'postgres',
      dbname: config['database'],
      username: config['username'],
      password: config['password'],
      dbhost: config['host'] || 'localhost',
      dbport: config['port'] || '5432',
      log_level: :info,
      sql_log_level: :debug,
      dump_schema_on_migrate: ENV['RACK_ENV'] != 'production',
      pg_dump: 'pg_dump --no-acl --no-owner',
      migrations_location: 'db/migrations',
      schema_location: 'db/migrations/schema.sql',
      maintenancedb: :default
    },
    self
  )
end

Dir["#{__dir__}/lib/tasks/*.rake"].each do |file|
  import file
end
