class Api::MenuController < Api::ApiController
  def show
    @menu = current_device.owner.zone.restaurant.menu

    respond_with :api, @menu, :api_template => :public
  end
end
