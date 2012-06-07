class Frontoffice::FrontofficeController < ApplicationController
  respond_to :html

  protect_from_forgery

  before_filter :authenticate_employee!
end