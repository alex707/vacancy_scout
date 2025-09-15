require_relative '../db/config'
require 'zeitwerk'

Sequel.default_timezone = :utc

Sequel::Database.extension :pagination
Sequel::Database.extension :pg_json
Sequel::Database.extension :server_block
Sequel::Database.extension :server_logging

Sequel::Model.plugin :timestamps, allow_manual_update: true, update_on_create: true
Sequel::Model.plugin :association_dependencies
LOGGER = Logger.new(STDOUT, level: ENV.fetch('LOGGER_LEVEL') { 'INFO' })
DB = Database::Config.connect(ENV['RACK_ENV'], logger: LOGGER)
APP_ROOT = File.expand_path('./../', __dir__)
APP_LOADER = Zeitwerk::Loader.new

APP_LOADER.ignore("#{APP_ROOT}/config/**/*")
APP_LOADER.ignore("#{APP_ROOT}/db/**/*")
APP_LOADER.ignore("#{APP_ROOT}/bin/**/*")
APP_LOADER.ignore("#{APP_ROOT}/spec/**/*")

[
  "#{APP_ROOT}/app/models",
  "#{APP_ROOT}/app/components",
  "#{APP_ROOT}/app/services",
].each(&APP_LOADER.method(:push_dir))
