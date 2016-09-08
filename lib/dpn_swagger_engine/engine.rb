module DpnSwaggerEngine
  class Engine < ::Rails::Engine
    isolate_namespace DpnSwaggerEngine

    initializer :assets do |app|
      # Rails.application.config.assets.precompile += [
      app.config.assets.precompile += [
        'dpn_swagger_engine/print.css',
        'dpn_swagger_engine/reset.css',
        # fonts
        'dpn_swagger_engine/DroidSans.ttf',
        'dpn_swagger_engine/DroidSans-Bold.ttf',
        # images
        'dpn_swagger_engine/collapse.gif',
        'dpn_swagger_engine/expand.gif',
        'dpn_swagger_engine/explorer_icons.png',
        'dpn_swagger_engine/favicon-16x16.png',
        'dpn_swagger_engine/favicon-32x32.png',
        'dpn_swagger_engine/favicon.ico',
        'dpn_swagger_engine/logo_small.png',
        'dpn_swagger_engine/pet_store_api.png',
        'dpn_swagger_engine/throbber.gif',
        'dpn_swagger_engine/wordnik_api.png'
      ]
      app.config.assets.paths << root.join(
        'app', 'assets', 'images', 'dpn_swagger_engine', 'dpn_swagger_engine'
      )
      app.config.assets.paths << root.join(
        'app', 'assets', 'fonts', 'dpn_swagger_engine', 'dpn_swagger_engine'
      )
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
