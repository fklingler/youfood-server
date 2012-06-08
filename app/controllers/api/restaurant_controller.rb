class Api::RestaurantController < Api::ApiController
  def show
    @restaurant = current_device.owner.restaurant

    respond_with :api, @restaurant, :api_template => :public
  end
end
