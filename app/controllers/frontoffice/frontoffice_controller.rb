class Frontoffice::FrontofficeController < ApplicationController
  respond_to :html

  layout 'frontoffice'

  protect_from_forgery
end