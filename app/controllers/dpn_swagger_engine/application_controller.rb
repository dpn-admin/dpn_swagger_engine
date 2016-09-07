module DpnSwaggerEngine
  class ApplicationController < ActionController::Base

    before_filter :authenticate

    protected

    def authenticate
      config = DpnSwaggerEngine.configuration
      if config.admin_username
        authenticate_or_request_with_http_basic do |username, password|
          username == config.admin_username && password == config.admin_password
        end
      end
    end
  end
end
