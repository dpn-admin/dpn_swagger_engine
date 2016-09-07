require_relative 'application_controller'

module DpnSwaggerEngine
  class SwaggersController < ApplicationController
    layout false

    before_filter :load_json_files

    def index
      redirect_to swagger_path(@json_files.first[0]) if @json_files.size == 1
    end

    def show
      respond_to do |format|
        api_id = params[:id]
        format.html do
          @swagger_json_url = swagger_path(api_id, format: :json)
        end
        format.json do
          send_file @json_files[api_id.to_sym], type: 'application/json', disposition: 'inline'
        end
      end
    end

    private

    def load_json_files
      @json_files ||= DpnSwaggerEngine.configuration.json_files || { default: "#{Rails.root}/lib/dpn_swagger_engine/swagger.json" }
    end
  end
end
