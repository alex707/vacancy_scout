require_relative 'spec_helper'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../config/boot', __dir__)
require File.expand_path('../config/initializer', __dir__)
require File.expand_path('../config/constants', __dir__)

APP_LOADER.setup
APP_LOADER.eager_load

Dir[File.expand_path('support', __dir__) + '/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    VacancyScout.app.freeze
  end
end
