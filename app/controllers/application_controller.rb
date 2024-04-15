class ApplicationController < ActionController::Base
  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |format|
      format.html { render 'errors/not_found', status: 404 }
      format.turbo_stream do
        flash[:error] = 'Record was not found. Check if the record still exists or if the record is deleted.'
        render 'errors/not_found', status: 404
      end
      format.json { render json: { error: 'Not found' }, status: 404 }
    end
  end
end
