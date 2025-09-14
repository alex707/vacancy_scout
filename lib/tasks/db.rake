require "logger"

def config
  Database::Config.get[ENV['RACK_ENV']]['primary']
end

def database
  Sequel.extension :migration
  db = Sequel.connect(config)
  db.loggers << Logger.new($stdout) if db.loggers.empty?
  db
end
