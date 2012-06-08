class Api::ApiController < ApplicationController
  self.responder = ActsAsApi::Responder
  respond_to :json

  before_filter :authenticate_device!

  prepend_before_filter :set_default_response_format
  protected
  def set_default_response_format
    request.format = :json if params[:format].nil?
  end
end