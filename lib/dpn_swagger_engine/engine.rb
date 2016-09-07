module DpnSwaggerEngine
  class Engine < ::Rails::Engine
    isolate_namespace DpnSwaggerEngine

    #https://gist.github.com/parndt/11381872
=begin
    initializer "dpn_swagger_engine.assets.precompile", group: :all do |app|
      app.config.assets.precompile += [
        'dpn_swagger_engine/print.css',
        'dpn_swagger_engine/reset.css'
      ]
    end
=end
    config.to_prepare do
      Rails.application.config.assets.precompile += [
        'dpn_swagger_engine/print.css',
        'dpn_swagger_engine/reset.css'
      ]
    end
  end

  class Configuration
    # [{ default: "swagger.json" }]
    attr_accessor :json_files
    attr_accessor :admin_username
    attr_accessor :admin_password
  end

  class << self
    attr_writer :configuration
  end

  module_function

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end
end
