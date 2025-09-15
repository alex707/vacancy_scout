# frozen_string_literal: true

require 'database_cleaner/sequel'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner[:sequel].db = DB
    DatabaseCleaner[:sequel].clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].strategy = :transaction
    DatabaseCleaner[:sequel].start
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].start
  end

  config.append_after(:each) do
    DatabaseCleaner[:sequel].clean
  end
end
