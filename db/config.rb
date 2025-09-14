require 'yaml'
module Database
  class Config
    def self.get
      template = File.read File.expand_path('../../config/database.yml', __FILE__)
      YAML.unsafe_load ERB.new(template).result(binding)
    end

    def self.connect(env, options = {})
      servers = get[env]
      raise 'ConfigurationError' unless servers.key?('primary')

      Sequel.connect servers['primary']
    end
  end
end
