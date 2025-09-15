require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/initializer', __FILE__)
require File.expand_path('../config/constants', __FILE__)

APP_LOADER.enable_reloading if ENV['RACK_ENV'] == 'development'
APP_LOADER.setup

use Rack::Cors do
  allow do
    if ENV['RACK_ENV'] == 'development'
      origins '*'
    end

    resource '*', headers: :any, methods: %i[get post put delete options head]
  end
end

if ENV['RACK_ENV'] == 'production'
  Zeitwerk::Loader.eager_load_all

  run VacancyScout
else
  run ->(env) {
    APP_LOADER.reload
    VacancyScout.call(env)
  }
end
