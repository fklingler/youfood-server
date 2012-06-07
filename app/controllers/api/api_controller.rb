class Api::ApiController < ApplicationController
  self.responder = ActsAsApi::Responder
  respond_to :json

  prepend_before_filter :set_default_response_format
  def set_default_response_format
    request.format = :json if params[:format].nil?
  end
end