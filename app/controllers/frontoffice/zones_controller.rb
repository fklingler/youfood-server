class Frontoffice::ZonesController < Frontoffice::FrontofficeController
  def index
    @restaurant = Restaurant.find_by_slug(params[:restaurant_id])
    @zones = @restaurant.zones

    respond_with :frontoffice, @restaurant, @zones
  end

  def show
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.find_by_slug(params[:id])

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def new
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.new

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def edit
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.find_by_slug(params[:id])

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def create
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.new(params[:zone])

    if params[:zone][:waiter]
      Waiter.find(params[:zone][:waiter]).update_attributes(zone: @zone)
    end
    if @zone.save
      flash[:notice] = "Successfully created zone."  
    end 

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def update
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.find_by_slug(params[:id])

    if params[:zone][:waiter]
      Waiter.find(params[:zone][:waiter]).update_attributes(zone: @zone)
      params[:zone].delete(:waiter)
    end
    if @zone.update_attributes(params[:zone])
      flash[:notice] = "Successfully updated zone."  
    end

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def destroy
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.find_by_slug(params[:id])
    @zone.destroy

    flash[:notice] = "Successfully destroyed zone."

    respond_with :frontoffice, @zone.restaurant, @zone
  end
end
